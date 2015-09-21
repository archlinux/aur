# Maintainer: Moritz Lipp <mail@mlq.me>
pkgname=smartscope
pkgver=0.3.0.0
pkgrel=1
pkgdesc="SmartScope App"
arch=('x86_64' 'i686')
url="https://www.lab-nation.com/"
license=('unknown')
depends=('mono' 'sdl_mixer' 'libusb')
makedepends=('tar')

_pkgver=`echo $pkgver | sed 's/\./-/g'`
_pkgname=SmartScope-Linux

source=("$_pkgname-$_pkgver.deb::https://www.lab-nation.com/package/smartscope/linux/latest/get"
"smartscope.sh")
md5sums=('3313b7c039f963c4c5b88ae63a32074a'
         '4e63224a3a40e165cf4bd2f777d288dc')

package() {
	cd "$srcdir"
  tar xfv data.tar.xz -C $pkgdir
  install -D -m755 smartscope.sh "$pkgdir/usr/bin/smartscope"
}
