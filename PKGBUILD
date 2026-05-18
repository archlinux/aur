# Maintainer: Mikele <mikele@gmail.com>
# Contributor: Mikele <mikele@gmail.com>

pkgname=appmeup-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Create and edit Chromium web apps from .desktop files"
arch=('x86_64')
url="https://github.com/mikelexp/appmeup"
license=('GPL3')
depends=('glibc')
optdepends=(
  'google-chrome: Google Chrome browser'
  'chromium: Chromium browser'
  'brave-bin: Brave browser'
  'vivaldi: Vivaldi browser'
)
source=("${url}/releases/download/v${pkgver}/appmeup-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('ef47757fc1b095415d2ce5715586a1ab83fe2720bfb227691d32f1fb43f4415c')

package() {
  cd "${srcdir}"

  install -Dm755 appmeup "${pkgdir}/usr/bin/appmeup"
  install -Dm644 icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/mikelexp.appmeup.png"
  install -Dm644 mikelexp.appmeup.desktop "${pkgdir}/usr/share/applications/mikelexp.appmeup.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
