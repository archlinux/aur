# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Release version does not work for some reason

pkgname=python-pygexf-git
_pkgname=python-pygexf
_pypiname=pygexf
pkgver=r29.4ec08e9
pkgrel=1
pkgdesc="A python library to generate gexf file format"
url="https://github.com/paulgirard/pygexf"
arch=('any')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=('LGPL')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}::"git+https://github.com/paulgirard/pygexf.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pypiname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pypiname}"
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
