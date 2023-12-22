# Maintainer: Funami
pkgname=rpi-imager-bin
pkgver=1.8.4
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
sha256sums=('cff1f88ed158519224a8790f2c4ea65baf547b8a215b55190470569b76d6476f')

package() {
  bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir"
  rm "$pkgdir/usr/share/doc/rpi-imager/copyright"
}
