# Contributor: Pavel Borzenkov <pavel@voidptr.ru>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=criu
pkgver=2.0
pkgrel=1
pkgdesc="A Checkpoint/Restore functionality for Linux in Userspace."
url="http://criu.org"
license=("GPL2")
arch=("x86_64")
source=("http://download.openvz.org/$pkgname/$pkgname-$pkgver.tar.bz2")
depends=('protobuf-c' 'libnl')
makedepends=('xmlto' 'asciidoc')
options=("!buildflags")
changelog=Changelog
md5sums=('12c453489dd1729505211eb034c6e441')
sha1sums=('29614201ba425a2609afacd056ff9a7ae53cf36d')
sha256sums=('e80726cc54f74751ae6f63a5b0cf9a2882ffc3fd2aa11b311da0384635d418ff')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" \
       PREFIX=/usr \
       SBINDIR=/usr/bin \
       LOGROTATEDIR=/etc/logrotate.d \
       LIBDIR=/usr/lib install
}

