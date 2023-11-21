# Maintainer: Funami
pkgname=rpi-imager-bin
pkgver=1.8.3
pkgrel=1
pkgdesc="Raspberry Pi Imaging Utility"
arch=('x86_64')
url="https://github.com/raspberrypi/rpi-imager"
license=('APACHE')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-svg' 'hicolor-icon-theme' 'gnutls' 'libcurl-gnutls' 'libarchive' 'dosfstools' 'util-linux')
optdepends=('udisks2: non-root user support')
provides=('rpi-imager')
conflicts=('rpi-imager')
source=("https://github.com/raspberrypi/rpi-imager/releases/download/v$pkgver/rpi-imager_${pkgver}_amd64.deb")
sha256sums=('85fa2fd34772e23fd2ff6e71c9fd167a0fb15470f96c8d7ed94499b145bf39e3')

package() {
  bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir"
  rm "$pkgdir/usr/share/doc/rpi-imager/copyright"
}
