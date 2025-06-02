# Maintainer: Zaman Huseynli <zamanhuseynli23@gmail.com>
# Backup contact <admin@azccriminal.space>

pkgname=crl-browser
pkgver=1.3
pkgrel=1
pkgdesc="CRL Browser - PyQt6 based CRL-Browser minimalist browsing"
arch=('any')
license=('MIT')
depends=('python' 'python-pyqt6' 'python-requests' 'pyinstaller')
makedepends=('python' 'python-pyqt6' 'python-requests' 'pyinstaller')
source=("crl-browser.py" "logo.png" "crl-browser.desktop")
sha256sums=('b082a7ece7520e2a212df37b70fc481efd361d46175bc1693b5dd400bdf76c9d' 'SKIP' 'SKIP')

build() {
  pyinstaller --onefile --windowed --name crl-browser --add-data "logo.png:." "${srcdir}/crl-browser.py"
}

package() {
  install -Dm755 "dist/crl-browser" "${pkgdir}/usr/bin/crl-browser"
  install -Dm644 "${srcdir}/logo.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/crl-browser.png"
  install -Dm644 "${srcdir}/crl-browser.desktop" "${pkgdir}/usr/share/applications/crl-browser.desktop"
}
