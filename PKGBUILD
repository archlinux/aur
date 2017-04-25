# Maintainer: Daniel Lima <danielm@nanohub.tk>

pkgname=gohufont-powerline
_gitname=$pkgname
pkgver=0.4
pkgrel=1
depends=()
makedepends=('xorg-bdftopcf')
url='https://github.com/limadm/gohufont-powerline'
license=('WTFPL')
pkgdesc="GohuFont with powerline and statusbar symbols."
arch=('any')
source=("git+https://github.com/limadm/${_gitname}#tag=${pkgver}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_gitname"
	make install PREFIX=/usr DESTDIR=$pkgdir
}

