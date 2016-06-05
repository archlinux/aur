# Contributor: Xyne <xyne at archlinux dot us>

pkgname=bindfs
pkgver=1.13.1
pkgrel=1
pkgdesc="A FUSE filesystem for mirroring a directory to another directory, similar to 'mount --bind', with permission settings."
arch=('i686' 'x86_64' 'armv6h' 'armv6l' 'armv7h')
url="http://bindfs.org/"
license=('GPL')
depends=('fuse')
source=("http://bindfs.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a77ae5c5f1879928e2fbe326a0931c6b5faca6e2ccdd37f01b974b62e0c8951b0f9dc7dd13488d6ebc228947ec874b91c79be97c4ea714aa703b527aa367e792')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make CPUOPTIMIZATIONS="${CFLAGS}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
