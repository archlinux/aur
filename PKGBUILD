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
sha256sums=('26234b8261784f87a5cf230a567e8c7f2582e8dfdb9b9ddb971a5057252ad1cd'
          '33347cd676decbc3882845a86d6cbc4cc3defd6dc350d03281c0aa429e9b2412')

package() {
  depends=('windsurf-bin' 'python')

  install -Dm 644 "${srcdir}"/windsurf-bin-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/windsurf-bin-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/opt/windsurf/resources/app/patch.py
}

