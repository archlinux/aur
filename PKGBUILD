# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=capo-shell
pkgver=1.7.0
pkgrel=1
pkgdesc="Wrapper to start a tool or shell with KUBECONFIG and OS_ environment variables to interact with cluster-api-provider-openstack clusters"
license=('APACHE')
arch=('any')
depends=('kubectl' 'yq')
optdepends=('fzf: needed for multi-capo-shell' 'moreutils: needed for sponge for CAPO_SHELL_KUBECONFIG_FILTER')
source=("$pkgname" "multi-capo-shell")
sha512sums=('8d382ef2626b2d832c80670c907b31550e642642f2568fa5adc7bfad423e6807adf48ca8c96bd069a18ed1ffe4154a61051e4b27221708349230d3dc27e488d4'
            '8e5ccdc2544b26531b03865aa324e545c825baafeb9fd7928393789daa2db0a15d1002fe194aa65b7d92089c37d0a3921841d65b0b961a432b88d12299419216')

package() {
  for file in "${source[@]}"; do
    install -D -m 0755 -t "$pkgdir/usr/bin/" "$srcdir/$file"
  done
}

#vim: syntax=sh
