# Maintainer: Max Bruckner
pkgname=lampe
pkgver=1.1.10
pkgrel=3
pkgdesc="control for your Philips Hue lights from Terminal or Gnome"
arch=("x86_64" "i686")
url="https://gitlab.com/poinck/lampe"
license=('custom')
depends=('curl' 'bc' 'zenity' 'json-sh' 'libsoup' 'gtk3' 'json-glib' 'lampe-bash')
optdepends=('redshift')
makedepends=('vala' 'git')
conflicts=('lampe-bash<1.1.8-3')
source=( "git+https://gitlab.com/poinck/${pkgname}.git#tag=$pkgver"
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
