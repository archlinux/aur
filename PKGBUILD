# Contributor: Pavel Borzenkov <pavel@voidptr.ru>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=criu
pkgver=2.9
pkgrel=1
pkgdesc="A Checkpoint/Restore functionality for Linux in Userspace."
url="http://criu.org"
license=("GPL2")
arch=("x86_64")
source=("http://download.openvz.org/$pkgname/$pkgname-$pkgver.tar.bz2")
depends=('protobuf-c' 'libnl')
makedepends=('xmlto' 'asciidoc' 'python')
options=("!buildflags")
changelog=Changelog
md5sums=('abd626265818190d34a0bee02a37f4d2')
sha1sums=('e7ab11cdaf01555a930a95679f260ff9c6eae9c9')
sha256sums=('21d1493e71b76fc0219a4274ca98332de3910cdd2e93070dc283ae4fc01421c9')

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

