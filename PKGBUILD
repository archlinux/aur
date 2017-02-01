# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=xdx
_pkgname=xdxclusterclient
pkgver=2.5.0
pkgrel=1
pkgdesc="Ham Radio DX-cluster client"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/xdxclusterclient/"
license=('GPL')
depends=('gtk2' 'cty')
optdepends=('hamradio-menus: XDG compliant menuing'
	    'hamlib: rig ionterfacing'
	    'gnuplot: graph output'
	    'sox: sound output')
source=(http://downloads.sourceforge.net/project/${_pkgname}/$pkgver/$pkgname-$pkgver.tar.gz)

build () {
	cd $pkgname-$pkgver

	export XDX_CTY="/usr/share/cty"

	./configure --prefix=/usr
	make || return 1
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
  
#	rm -r $startdir/pkg/usr/share/xdx/wwv.gnuplot~
}
md5sums=('8b5d1f60670b0659022a66ff8cb74f4f')
sha256sums=('bf689015e6604c462333bde3383027c01bdfcf9f764f6ea2f1a77bff8eb98fdb')
