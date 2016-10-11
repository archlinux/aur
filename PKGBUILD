# Maintainer: Diego Nieto Cid <dnietoc@gmail.com>

_name="uritemplate"
_module="${_name}.py"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="3.0.0"
pkgrel="1"
pkgdesc="Simple python library to deal with URI Templates."
arch=("any")
url="https://github.com/sigmavirus24/${_name}"
license=("BSD" "APACHE")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.io/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('1ec31e0d8a2eec72357b2cef4bce5945')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    python2 setup.py build
}

package_python-uritemplate.py() {
    depends=("python")
    conflicts=("python-uritemplate")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 LICENSE.APACHE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE.APACHE
    install -Dm644 LICENSE.BSD "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE.BSD
}

package_python2-uritemplate.py() {
    depends=("python2")
    conflicts=("python2-uritemplate")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 LICENSE.APACHE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE.APACHE
    install -Dm644 LICENSE.BSD "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE.BSD
}
