# Maintainer: Nathan Chere <aur@nathanchere.com.au>
# Contributor: Luca Steccanella <steccas at pm dot me>
# Contributor: ZorinArch < zorinarch at protonmail dot com >

pkgname=windsurf-next-marketplace
pkgver=1.1.0
pkgrel=3
pkgdesc='Enable vscode marketplace in windsurf-next'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('0BSD')
install="${pkgname}.install"
source=('windsurf-next-marketplace.hook'
        'patch.py')
sha256sums=('4962b28571e3305196f082817db648010685f747097b7fc8d0170a157e6fa682'
            'cbb67095313282989b34c1ff41e3717c2136ff6c010479ac841dfddf7fd68441')

package() {
  depends=('windsurf-next' 'python')

  install -Dm 644 "${srcdir}"/windsurf-next-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/windsurf-next-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/usr/share/windsurf-next/resources/app/patch.py
}
