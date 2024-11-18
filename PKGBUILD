# Maintainer: ZorinArch < zorinarch at protonmail dot com >

pkgname=windsurf-bin-marketplace
pkgver=1.94.0
pkgrel=1
pkgdesc='Enable vscode marketplace in windsurf-bin'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
install="${pkgname}.install"
source=('windsurf-bin-marketplace.hook'
        'patch.py')
sha256sums=('9427e3b8d6d2ae18d23143f6d1915d65cbabca673cce7a090d822934c2cd4eba'
          '33347cd676decbc3882845a86d6cbc4cc3defd6dc350d03281c0aa429e9b2412')

package() {
  depends=('windsurf-bin' 'python')

  install -Dm 644 "${srcdir}"/windsurf-bin-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/windsurf-bin-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/usr/share/windsurf-bin/resources/app/patch.py
}

