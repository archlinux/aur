# Maintainer: M0Rf30

pkgname=ultimate_control
pkgver=1.2
pkgrel=1
pkgdesc="Ultimate Control is a set of software tools that allow you to take control of your computer wirelessly."
arch=('i686' 'x86_64')
url="http://www.negusoft.com/index.php/ultimate-control"
license=('custom')
depends=('java-runtime-headless')
_arch='64bit'
[[ "${CARCH}" = i686 ]] && _arch='32bit'
source=("http://www.negusoft.com/downloads/${pkgname}_v${pkgver}_linux_${_arch}.tar.gz")
md5sums=('0ad5bdbea3053ce419fd3b941262917b')
[[ "$CARCH" == 'i686' ]] && md5sums[0]='23ba928ef36e63fe6d3a84e4b0bde485'
install=ultimate_control.install

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/lib/ucontrol
  mkdir -p ${pkgdir}/usr/bin
  cp -f -r lib/ucontrol.jar ${pkgdir}/usr/lib/ucontrol/ucontrol.jar
  cp -f -r lib/icon.png ${pkgdir}/usr/lib/ucontrol/icon.png
  cp -f -r bin/ucontrol ${pkgdir}/usr/bin/ucontrol
  chmod 744 ${pkgdir}/usr/lib/ucontrol/*
  install -vDm644 "Ultimate Control.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
