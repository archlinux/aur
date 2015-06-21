# Contributor: Xyne <xyne at archlinux dot us>

pkgname=bindfs
pkgver=1.12.6
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64')
url="http://bindfs.org/"
license=('GPL')
depends=('fuse')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('14fd335a082bc577bb67360a892953d6d059b97b24e6fa74ddc1457ed78f3a546799f3cdea48a37da89dfc06be2ee1f5abafc203f6843269f28a79c7d18093b0')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make CPUOPTIMIZATIONS="${CFLAGS}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
