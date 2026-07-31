# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=capo-shell
pkgver=1.8.2
pkgrel=1
pkgdesc="Wrapper to start a tool or shell with KUBECONFIG and OS_ environment variables to interact with cluster-api-provider-openstack clusters"
license=('APACHE')
arch=('any')
depends=('kubectl' 'yq')
optdepends=('fzf: needed for multi-capo-shell')
source=("$pkgname" "multi-capo-shell")
sha512sums=('fa43e99f32679f469554a7e28918a9d0b9d90418c1d027de0e299ff24a7471231a4d236a02cc17ccc108e10659fc51c2bd81fd00ed464f8e8b86c75d52870f2f'
            '8e5ccdc2544b26531b03865aa324e545c825baafeb9fd7928393789daa2db0a15d1002fe194aa65b7d92089c37d0a3921841d65b0b961a432b88d12299419216')

package() {
  for file in "${source[@]}"; do
    install -D -m 0755 -t "$pkgdir/usr/bin/" "$srcdir/$file"
  done
}

#vim: syntax=sh
