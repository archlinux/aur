# Contributor: Pavel Borzenkov <pavel@voidptr.ru>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=criu
pkgver=1.8
pkgrel=1
pkgdesc="A Checkpoint/Restore functionality for Linux in Userspace."
url="http://criu.org"
license=("GPL2")
arch=("x86_64")
source=("http://download.openvz.org/$pkgname/$pkgname-$pkgver.tar.bz2")
depends=("protobuf-c")
makedepends=("xmlto" "asciidoc")
options=("!buildflags")
changelog=Changelog
md5sums=('d21475d66a1374bc43364b1508b086fc')
sha1sums=('1301288bd8e6efe23b89c4c19ba5c7b80fa748bf')
sha256sums=('d1d6693d23181b1cd7378d77c142e41bcac3cb2ae5c71ea4c5b7de01f65575bb')

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

