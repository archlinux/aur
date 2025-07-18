# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=capo-shell
pkgver=1.3.0
pkgrel=1
pkgdesc="Wrapper to start a tool or shell with KUBECONFIG and OS_ environment variables to interact with cluster-api-provider-openstack clusters"
license=('APACHE')
arch=('any')
depends=('kubectl' 'yq')
optdepends=('fzf: needed for multi-capo-shell' 'moreutils: needed for sponge for CAPO_SHELL_KUBECONFIG_FILTER')
source=("$pkgname" "multi-capo-shell")
sha512sums=('e7f25e8903ef07eb738fdfd96537b7802074693a52c88b32c905a499fcdff9b0b37d662c1a68459c555ba4173c8a6a4bda224104f65e7d84abc46eece299aceb'
            '24753d9a0cdd55a2b8449ef093f4638c284a8a066d2b5481a6074ea99fae7163adb975b456f2b378d168529742b243f2ad4fdeb92b114c3951906558a06a0a15')

package() {
  for file in "${source[@]}"; do
    install -D -m 0755 -t "$pkgdir/usr/bin/" "$srcdir/$file"
  done
}

#vim: syntax=sh
