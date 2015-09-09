# Maintainer: Darrell Enns <darrell@darrellenns.com>
_pkgname=leslie
pkgname=${_pkgname}-git
pkgrel=1
pkgver=d2617a6
pkgdesc="A leslie audio effect with jack, OSC control, and (optionally) an opengl GUI."
url="https://github.com/dack/leslie"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('liblo' 'libgl' 'glut' 'ftgl' 'boost-libs' 'jack')
makedepends=('boost')
conflicts=()
replaces=()
backup=()
source=('leslie::git+https://github.com/dack/leslie.git')
sha1sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
	./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
	git rev-parse --short HEAD
}
