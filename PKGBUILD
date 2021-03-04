# Maintainer: Kyle Laker <kyle+aur at laker dot email>
pkgname='python-pystemd'
_name="${pkgname#python-}"
pkgver='0.8'
pkgrel=1
pkgdesc='A thin Cython-based wrapper on top of libsystemd, focused on exposing the dbus API via sd-bus in an automated and easy to consume way.'
arch=('any')
url='https://github.com/facebookincubator/pystemd'
license=('LGPL2.1')
depends=('python' 'cython')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v.${pkgver}.tar.gz")
md5sums=('bdf61ef1575513c70e3036b7aa4ace80')

build() {
    cd "${srcdir}/${_name}-v.${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-v.${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
