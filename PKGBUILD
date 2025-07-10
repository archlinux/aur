# Maintainer: gilcu3
# Previous Maintainer: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="mtable"
pkgname="python-${_name}"
pkgver=0.2.22
_commit="3aae491c5ffd93d3c9e23da53733cf15026a50cb"
pkgrel=1
pkgdesc="Format data to reStructedText and Markup Table"
arch=('any')
url="https://github.com/liuyug/${_name}"
license=('BSD')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
# testdepends=('python-chardet')
depends=('python' 'python-wcwidth' 'python-beautifulsoup4' 'python-pandas')
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('c0709196bde5f2503523d3fa9b937cb33cc07e11ba5d23397823375f05a455b8')

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package () {
  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -Dm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
