# Maintainer: mehalter <micah at mehalter.com>

_pkgname=ueberzug
pkgname=python-${_pkgname}-git
pkgver=gb89ff85
pkgrel=2
pkgdesc="ueberzug is an python script which aims to replace w3mimgdisplay"
arch=('any')
url="https://github.com/seebye/${_pkgname}"
license=('GPL3')
depends=("python" "python-xlib" "python-docopt" "python-psutil" "python-pillow" "python-attrs")
makedepends=("python")
source=("git+${url}.git#branch=master")
md5sums=('SKIP')
conflicts=("python-${_pkgname}")
provides=("python-${_pkgname}=${pkgver}")

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --prefix=/usr --root "${pkgdir}" || return 1
}
