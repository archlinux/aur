# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=capo-shell
pkgver=1.2.0
pkgrel=1
pkgdesc="Wrapper to start a tool or shell with KUBECONFIG and OS_ environment variables to interact with cluster-api-provider-openstack clusters"
license=('APACHE')
arch=('x86_64')
depends=('kubectl' 'yq')
optdepends=('fzf: needed for multi-capo-shell' 'moreutils: needed for sponge for CAPO_SHELL_KUBECONFIG_FILTER')
source=("$pkgname" "multi-capo-shell")
sha512sums=('e7f25e8903ef07eb738fdfd96537b7802074693a52c88b32c905a499fcdff9b0b37d662c1a68459c555ba4173c8a6a4bda224104f65e7d84abc46eece299aceb'
            '9b9c662482b0db71e609857df7fb2e30c6448b0ef2142ccdd7a018bac4e37695ad8d85cc0bbe3c60230047873701485764e8df5c3db996f8866b19d372c92651')

package() {
  for file in "${source[@]}"; do
    install -D -m 0755 -t "$pkgdir/usr/bin/" "$srcdir/$file"
  done
}

#vim: syntax=sh
