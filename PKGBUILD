# Maintainer: Carl George < arch at cgtx dot us >

_name="ddt"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Data-Driven/Decorated Tests"
arch=("any")
url="https://github.com/txels/ddt"
license=("MIT")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/txels/ddt/master/LICENSE.md")
sha256sums=('e24ecb7e2cf0bf43fa9d4255d3ae2bd0b7ce30b1d1b89ace7aa68aca1152f37a'
            '2f7e8cfb4a28a77fa735a4ec9dc0d59a017f3e1d7d421f2bc854a110810ef774')

package_python-ddt() {
    depends=("python")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm0644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-ddt() {
    depends=("python2")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -Dm0644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
