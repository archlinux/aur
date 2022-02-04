# Maintainer: Funami
pkgname=rpi-imager-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="Raspberry Pi Imaging Utility"
arch=('x86_64')
url="https://github.com/raspberrypi/rpi-imager"
license=('APACHE')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-svg' 'hicolor-icon-theme' 'libcurl-gnutls' 'libarchive' 'dosfstools' 'util-linux')
optdepends=('udisks2: non-root user support')
provides=('rpi-imager')
conflicts=('rpi-imager')
source=("https://github.com/raspberrypi/rpi-imager/releases/download/v$pkgver/rpi-imager_${pkgver}_amd64.deb")
sha256sums=('03e8a36b4342a00ff66abd44e88a5e74f271ec138a317b57dd0965bf0b0d5acd')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  rm "$pkgdir/usr/share/doc/rpi-imager/copyright"
}
