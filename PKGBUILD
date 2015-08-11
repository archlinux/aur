# Maintainer: Carl George < arch at cgtx dot us >

_name="unicodecsv"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.13.0"
pkgrel="1"
pkgdesc="Python2's stdlib csv module is nice, but it doesn't support unicode. This module is a drop-in replacement which *does*."
arch=("any")
url="https://github.com/jdunck/python-${_name}"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/jdunck/python-unicodecsv/master/LICENSE")
sha256sums=('a913fa13a26b4b25058950f8d6231abee855e8a03a0f265274b3ed30a91034a3'
            'a3b3fcd3f2b3e97b4c4ffc354f719e1519dc95dc0b09d82f769538feeb7db032')

package_python-unicodecsv() {
    depends=("python")
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-unicodecsv() {
    depends=("python2")
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
