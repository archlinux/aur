# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=python-altair
_pyname=altair
pkgname=('python-altair')
pkgver=4.2.2
pkgrel=1
pkgdesc="Declarative statistical visualization library for Python"
arch=('any')
url="https://altair-viz.github.io/"
license=('BSD3')
depends=(python-entrypoints python-jinja python-jsonschema python-numpy python-pandas python-toolz)
makedepends=(python-build python-installer python-wheel)
optdepends=('python-selenium: png and svg export support')
source=("${_pyname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('39399a267c49b30d102c10411e67ab26374156a84b1aeb9fcd15140429ba49c5')


build () {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set et sw=2 ts=2 tw=79:
