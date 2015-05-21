pkgname=flvstreamer
pkgver=2.1c1
pkgrel=4
pkgdesc="Open source command-line RTMP client"
url="http://savannah.nongnu.org/projects/flvstreamer"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
source=("http://mirrors.zerg.biz/nongnu/flvstreamer/source/$pkgname-$pkgver.tar.gz")
md5sums=('4866387328ad89c957af90a2478e5556')

build() {
  cd "$pkgname"
  make "$pkgname"
  make streams
}

package() {
  cd "$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 streams "$pkgdir/usr/bin/streams"
}

# vim:set ts=2 sw=2 et:
