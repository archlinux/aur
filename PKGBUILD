# Maintainer: Funami
pkgname=rpi-imager-bin
pkgver=1.7.4
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
sha256sums=('d4fb2eba21ccd0be0a31c3dab5c6904900df9971cc8fed1d11af6a816c7666b3')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  rm "$pkgdir/usr/share/doc/rpi-imager/copyright"
}
