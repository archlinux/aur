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
 sha256sums=('a3e4ec03672d510f895523f194a1a62cb8b6225ddf86c0f156420e0d33dbda97'
          '33347cd676decbc3882845a86d6cbc4cc3defd6dc350d03281c0aa429e9b2412')

package() {
  depends=('windsurf-bin' 'python')

  install -Dm 644 "${srcdir}"/windsurf-bin-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/windsurf-bin-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/opt/windsurf/resources/app/patch.py
}

