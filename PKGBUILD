# Maintainer: travisghansen <travisghansen@yahoo.com>

pkgname=yubico-piv-tool
pkgver=1.0.1
pkgrel=1
pkgdesc="Tool to interact with the PIV applet on a YubiKey NEO"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('pcsclite')
url=https://developers.yubico.com/yubico-piv-tool/
source=("${pkgname}-${pkgver}.tar.gz::https://developers.yubico.com/yubico-piv-tool/Releases/${pkgname}-${pkgver}.tar.gz")
md5sums=('0a3f13f67c0f7e907df9563c71acf605')
options=(!libtool)

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" make install
}
