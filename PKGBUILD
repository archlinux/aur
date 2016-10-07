# Contributor: Xyne <xyne at archlinux dot us>

pkgname=bindfs
pkgver=1.13.3
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL')
depends=('fuse')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('3bfd7d3896a6c9dec68ba071cb1fbc5177f6fef3b1c87db413e858fe3ef5c98724ae98dfbdff315e480df433c089e0e35709182a237c26650217caa5890d6f33')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make CPUOPTIMIZATIONS="${CFLAGS}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
