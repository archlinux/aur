# Maintainer: Nathan Chere <aur@nathanchere.com.au>
# Contributor: Luca Steccanella <steccas at pm dot me>
# Contributor: ZorinArch < zorinarch at protonmail dot com >

pkgname=windsurf-next-marketplace
pkgver=1.1.0
pkgrel=4
pkgdesc='Enable vscode marketplace in windsurf-next'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('0BSD')
install="${pkgname}.install"
source=('windsurf-next-marketplace.hook'
        'patch.py')
sha256sums=('4962b28571e3305196f082817db648010685f747097b7fc8d0170a157e6fa682'
            'db961a0fd3b38e31068f6aa4be6baf9c4a5159880f416fa229309d2523afa19f')

package() {
  depends=('windsurf-next' 'python')

  install -Dm 644 "${srcdir}"/windsurf-next-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/windsurf-next-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/opt/windsurf-next/resources/app/patch.py
}
