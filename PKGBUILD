# Maintainer: Kyle Laker <kyle+aur at laker dot email>
pkgname='python-pystemd'
_name="${pkgname#python-}"
pkgver='0.7'
pkgrel=1
pkgdesc='A thin Cython-based wrapper on top of libsystemd, focused on exposing the dbus API via sd-bus in an automated and easy to consume way.'
arch=('any')
url='https://github.com/facebookincubator/pystemd'
license=('LGPL2.1')
depends=('python' 'python-setuptools' 'cython' 'python-mock' 'python-pypandoc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('a287210503fe1c08cef612d09f76f790')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
