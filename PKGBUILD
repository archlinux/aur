# Maintainer: Moritz Lipp <mail@mlq.me>
pkgname=smartscope
pkgver=0.1.0.0
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
md5sums=('97992fb1a26da88da110f95c5e6a733e'
         '4e63224a3a40e165cf4bd2f777d288dc')

package() {
	cd "$srcdir"
  tar xfv data.tar.xz -C $pkgdir
  install -D -m755 smartscope.sh "$pkgdir/usr/bin/smartscope"
}
