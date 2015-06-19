# Maintainer: Mikkel Kroman <mk@maero.dk>
pkgname=randompd
pkgver=0.2
pkgrel=1
pkgdesc="Command-line utillity for quickly adding a random track to your mpd playlist."
arch=('i686' 'x86_64')
url="https://github.com/mkroman/randompd"
license=('MIT')
makedepends=('git')
depends=('glibc' 'libmpdclient')
source=("git+https://github.com/mkroman/randompd.git#tag=v$pkgver")
sha1sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
  make
}

package() {
	cd "$srcdir/$pkgname"
  install -Dm0755 randompd "$pkgdir/usr/bin/randompd"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/randompd/LICENSE"
}
