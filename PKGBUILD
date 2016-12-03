# Contributor: Xyne <xyne at archlinux dot us>

pkgname=bindfs
pkgver=1.13.5
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL')
depends=('fuse')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1de334e0ddfbd9f2a31c16959c1bee8b4609cd42dab234870a8cdd49697785f798c458e13a57723e4b3582f10e5a20ec29cc039fb562ff2114e0ccc120535e6d')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make CPUOPTIMIZATIONS="${CFLAGS}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
