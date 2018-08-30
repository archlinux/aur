# Maintainer: Marcos Ferreira <merkkp at gmail dot com>

_gitname="python-azlyrics"
pkgname="${_gitname}-git"
pkgver=f55454e
pkgrel=1
pkgdesc="api & cli app for azlyrics.com"
arch=("any")
url="https://github.com/ffmarcos/python-azlyrics"
license=("GPL")
depends=("python" "python-beautifulsoup4")
makedepends=("git" "python-setuptools")
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("git+https://github.com/mracos/${_gitname}")
md5sums=("SKIP")

pkgver() {
  cd "${_gitname}"
  git describe --tags --long --always | sed 's/^v//;s/-/./;s/-/./g'
}

build() {
  cd "${_gitname}"
  python setup.py build --verbose
}

package() {
  cd "${_gitname}"
  python setup.py install -O1 --skip-build --verbose --root="${pkgdir}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
