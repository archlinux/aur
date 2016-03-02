# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=flvstreamer
pkgver=2.1c1
pkgrel=5
pkgdesc="Open source command-line RTMP client"
url="http://savannah.nongnu.org/projects/flvstreamer"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('glibc')
source=("http://download.savannah.gnu.org/releases/flvstreamer/source/$pkgname-$pkgver.tar.gz")
md5sums=('4866387328ad89c957af90a2478e5556')

build() {
  cd "$srcdir/$pkgname"
  make flvstreamer
  make streams
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 flvstreamer "$pkgdir/usr/bin/flvstreamer"
  install -Dm755 streams "$pkgdir/usr/bin/streams"
}

# vim:set ts=2 sw=2 et:
