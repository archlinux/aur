# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=xdx
_pkgname=xdxclusterclient
pkgver=2.4.3
pkgrel=1
pkgdesc="Ham Radio DX-cluster client"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/xdxclusterclient/"
license=('GPL')
depends=('gtk2')
optdepends=('hamlib: rig ionterfacing'
	    'gnuplot: graph output' 
	    'sox: sound output')
source=(http://downloads.sourceforge.net/project/${_pkgname}/$pkgver/$pkgname-$pkgver.tar.gz)

build () {
	cd $pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
  
#	rm -r $startdir/pkg/usr/share/xdx/wwv.gnuplot~
}
md5sums=('029febeeb7b23349db828f489e214787')
sha256sums=('fc6e49a2c2a9d7c729acf68e659bf8f5ebd402dc3be0f781bd50b8b76b01427c')
