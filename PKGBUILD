
_pkgname=x-tile
pkgname=${_pkgname}-git
pkgver=2.5.r4.g6f39fd8
pkgrel=1
pkgdesc="A gnome/xfce tiling applet for your panel"
arch=(any)
url=http://www.giuspen.com/$_pkgname
license=(GPL2)

depends=(hicolor-icon-theme python2-gconf)
makedepends=('git')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}::git+https://github.com/giuspen/x-tile.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"

    echo "python script, so nothing to build :) "
}

package() {
	cd "${srcdir}/${_pkgname}"

	python2 setup.py install --prefix=/usr --root="${pkgdir}"
}


