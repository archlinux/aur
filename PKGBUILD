# Maintainer: somekool <somekool _ at _ gmail _ dot _com>

pkgname=libpasori
pkgver=0.2
pkgrel=0
pkgdesc="SONY RC-S320 USB FeliCa NFC RFID Card Reader/Writer(PaSoRi)."
arch=('i686' 'x86_64')
url=("http://libpasori.osdn.jp")
license='BSD'
depends=()
optdepends=()
makedepends=()
source="http://osdn.jp/frs/redir.php?m=jaist&f=%2Flibpasori%2F20457%2Flibpasori02.tar.bz2"
md5sums=('c23f2a3ae3d699bcd7a269dbd64120fb')

build() {
  cd libpasori/src
  sh ./buildline-libusb.sh
}

package() {
  mkdir -p ${pkgdir}/usr/bin/
  cp libpasori/src/lpdump ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/src/libpasori
  cp libpasori/src/*.h libpasori/src/*.c ${pkgdir}/usr/src/libpasori/
}

