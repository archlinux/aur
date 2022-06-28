# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=clicky
pkgver=0.1
pkgrel=1
pkgdesc='Save images of your screen or individual windows. Desktop screenshot application'
arch=('any')
url="https://github.com/linuxmint/clicky"
license=(GPL3)
depends=(
    gsound
    python
    python-gobject
    python-setproctitle
    python-xapp
    python-xlib
    xapp
)
makedepends=(
    git
    gettext
    intltool
)
conflicts=(
    clicky-git
)
_commit='4ba6382183bf10d983427b8ef2df4e9d67322380'
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=('SKIP')

build() {
	cd "${pkgname}"
	make
}

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr $pkgdir
}
