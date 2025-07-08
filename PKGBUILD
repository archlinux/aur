# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=capo-shell
pkgver=1.2.1
pkgrel=1
pkgdesc="Wrapper to start a tool or shell with KUBECONFIG and OS_ environment variables to interact with cluster-api-provider-openstack clusters"
license=('APACHE')
arch=('any')
depends=('kubectl' 'yq')
optdepends=('fzf: needed for multi-capo-shell' 'moreutils: needed for sponge for CAPO_SHELL_KUBECONFIG_FILTER')
source=("$pkgname" "multi-capo-shell")
sha512sums=('e7f25e8903ef07eb738fdfd96537b7802074693a52c88b32c905a499fcdff9b0b37d662c1a68459c555ba4173c8a6a4bda224104f65e7d84abc46eece299aceb'
            'b56fd59f822db372ee2aa19f10dce2ef4b0e7f959a17b01b023279993bbb2b2dfeb3f7cc883124eef621de9994c1d69759c9a85150d90472e84bfa07a95cb0d4')

package() {
  for file in "${source[@]}"; do
    install -D -m 0755 -t "$pkgdir/usr/bin/" "$srcdir/$file"
  done
}

#vim: syntax=sh
