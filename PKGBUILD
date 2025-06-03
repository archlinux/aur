# Maintainer: Zaman Huseynli <zamanhuseynli23@gmail.com>
# Backup contact <admin@azccriminal.space>

pkgname=crl-browser
pkgver=1.3
pkgrel=1
url="https://gitlab.com/Azccriminalus/crlnxlion"
pkgdesc="CRL Browser - PyQt6 based CRL-Browser minimalist browsing"
arch=('any')
license=('MIT')
depends=('python' 'python-pyqt6' 'python-requests' 'pyinstaller')
makedepends=('python' 'python-pyqt6' 'python-requests' 'pyinstaller')
source=(
  "https://gitlab.com/Azccriminalus/crlnxlion/-/raw/main/src/crl-browser.py"
  "https://gitlab.com/Azccriminalus/crlnxlion/-/raw/main/src/logo.png"
  "https://gitlab.com/Azccriminalus/crlnxlion/-/raw/main/src/crl-browser.desktop"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

build() {
  pyinstaller --onefile --windowed --name crl-browser --add-data "logo.png:." "${srcdir}/crl-browser.py"
}

package() {
  install -Dm755 "dist/crl-browser" "${pkgdir}/usr/bin/crl-browser"
  install -Dm644 "${srcdir}/logo.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/crl-browser.png"
  install -Dm644 "${srcdir}/crl-browser.desktop" "${pkgdir}/usr/share/applications/crl-browser.desktop"
}
