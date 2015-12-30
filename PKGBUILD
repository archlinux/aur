pkgname=qtinline-git
_gitname="qt.inline"
pkgdesc="Qt wrapper, for binding."
pkgver=0.0.0.11
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/kitech/qt.inline"
license=('None')
depends=('qt5-base')
makedepends=('git' 'cmake')
source=('git://github.com/kitech/qt.inline.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo "0.0.0.$(git rev-list --count HEAD)"
}

build() {
	cd $_gitname
	cmake .
	make
}

package() {
	cd $_gitname
    install -D -m755 "${srcdir}/${_gitname}/libQtInline.so" "${pkgdir}/usr/lib/libQtInline.so"
}

