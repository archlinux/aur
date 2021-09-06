# Maintainer: Kyle Laker <kyle+aur at laker dot email>
pkgname='python-pystemd'
_name="${pkgname#python-}"
pkgver='0.9.0'
pkgrel=1
pkgdesc='A thin Cython-based wrapper on top of libsystemd, focused on exposing the dbus API via sd-bus in an automated and easy to consume way.'
arch=('any')
url='https://github.com/facebookincubator/pystemd'
license=('LGPL2.1')
depends=('python' 'cython')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v.${pkgver}.tar.gz")
md5sums=('f9be8301d4be4dff2c9f112879b71b9f')

build() {
    cd "${srcdir}/${_name}-v.${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-v.${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
