# Maintainer: jason ryan <jasonwryan@gmail.com>

pkgname=vimb-git
_pkgname=vimb
pkgver=2.10.r6.g1a8f7e5
pkgrel=1
pkgdesc="Vimb is a lightweight WebKit-based browser"
arch=('i686' 'x86_64')
url="http://fanglingsu.github.io/vimb"
license=('GPL3')
depends=('webkitgtk2')
provides=('vimb')
conflicts=('vimb')
source=('git+https://github.com/fanglingsu/vimb.git')
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
	make
}

package() {
    cd "${_pkgname}"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
