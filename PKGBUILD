# Maintainer: Max Bruckner
pkgname=lampe
pkgver=1.1.10
pkgrel=1
pkgdesc="Interactive bash-script to control your Philips Hue lights."
arch=("x86_64" "i686")
url="https://github.com/poinck/lampe"
license=('custom')
depends=('curl' 'bc' 'zenity' 'json-sh' 'libsoup' 'gtk3' 'json-glib' 'lampe-bash')
optdepends=('redshift')
makedepends=('vala')
conflicts=('lampe-bash<1.1.8-3')
source=( "git+https://github.com/poinck/${pkgname}#tag=$pkgver"
)
md5sums=( SKIP )

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
	rm "$pkgdir/usr/bin/lampe"
}
