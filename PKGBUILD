# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: valère monseur <valere dot monseur at ymail dot com>

_name="livereload"
_module="${_name}"

pkgname="python-${_module}"
pkgver=2.4.1
pkgrel=2
pkgdesc="An awesome tool for web developers."
arch=("any")
url="https://github.com/lepture/python-livereload"
license=("BSD")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('887cc9976d72d7616fa57c82c4ef5bf5da27e2350dfd6f65d3f44e86efc51b92')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    depends=("python-six" "python-tornado")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
