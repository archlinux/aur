# Maintainer: travisghansen <travisghansen@yahoo.com>

pkgname=yubico-piv-tool
pkgver=1.4.4
pkgrel=1
pkgdesc="Tool to interact with the PIV applet on a YubiKey NEO"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('pcsclite' 'openssl-1.0')
url=https://developers.yubico.com/yubico-piv-tool/
source=("${pkgname}-${pkgver}.tar.gz::https://developers.yubico.com/yubico-piv-tool/Releases/${pkgname}-${pkgver}.tar.gz")
md5sums=('bdada97514316bd7d712f8dfc6ee6a5e')
options=(!libtool)

build() {
  cd "${pkgname}-${pkgver}"
  PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" make install
}
