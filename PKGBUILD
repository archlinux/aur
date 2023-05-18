# Maintainer: Funami
pkgname=rpi-imager-bin
pkgver=1.7.4.1
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
sha256sums=('ab31f2cdbd6783d43fc6b10e149da6a22cef5430ffd2b9d60c80a7c1a20cd64e')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  rm "$pkgdir/usr/share/doc/rpi-imager/copyright"
}
