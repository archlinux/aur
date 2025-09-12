# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

pkgname=tcpreen
pkgver=1.4.4
pkgrel=1

pkgdesc='TCPreen is a simple tool to monitor and analyze data transmitted between clients and servers through connection-oriented streams data such as a TCP sessions'
arch=('x86_64')
url='https://www.remlab.net/tcpreen/'
license=('GPL-2.0')
makedepends=('make' 'coreutils')
provides=('tcpreen')
conflicts=('tcpreen')
source=("https://www.remlab.net/files/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('6b2d712929184f6332d9760c943124873f8e6cb6ecdc2aca8fb793a1bc4c5cf9')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make clean
  make -j $(nproc)
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
