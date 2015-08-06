# Maintainer: Diego Nieto Cid <dnietoc@gmail.com>

_name="uritemplate"
_module="${_name}.py"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.3.0"
pkgrel="1"
pkgdesc="Simple python library to deal with URI Templates."
arch=("any")
url="https://github.com/sigmavirus24/${_name}"
license=("custom:Modified BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_module:0:1}/${_module}/${_module}-${pkgver}.tar.gz")
md5sums=('4dd14904ba502c6ff8d6276e004404de')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
    python2 setup.py build
}

package_python-uritemplate.py() {
    depends=("python")
    conflicts=("python-uritemplate")
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

package_python2-uritemplate.py() {
    depends=("python2")
    conflicts=("python2-uritemplate")
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
