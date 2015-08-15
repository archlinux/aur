##Author##
#Eka Tresna Irawan/Ibnu Yahya (anak10thn@gmail.com)
#PKGBUILD
#Sofyan Saputra/Iank (meongbego@gmail.com)

pkgname=ignsdk-iot
pkgver=0.1.3
pkgrel=160815
pkgdesc="IGN Software Development Kit IOT For Raspberry Pi type 2"
url="https://github.com/anak10thn/ignsdk-qt"
arch=('armv7h')
license=('BSD')
depends=('qt5-base' 'qt5-webkit' 'qt5-websockets' 'qt5-serialport')
options=('!strip' '!emptydirs')
source=('https://github.com/anak10thn/ignsdk-iot/archive/0.1.3.tar.gz')
md5sums=('SKIP')
_gourl=github.com/anak10thn/ignsdk-qt
install='ignsdk.install'
  
build() {
	cd ignsdk-iot-0.1.3
	qmake
	make -j4
}

package() {
  cd ignsdk-iot-0.1.3
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/etc/ignsdk/board
 
  install -Dm 755 bin/ignsdk-iot $pkgdir/usr/bin/
  install -Dm 755 config/rpi2.json $pkgdir/etc/ignsdk/board
    
  rm -rf *.o

}


