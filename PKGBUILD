# Maintainer: Kyle Laker <kyle+aur at laker dot email>
pkgname='python-pystemd'
_name="${pkgname#python-}"
pkgver='0.12.0'
pkgrel=1
pkgdesc='A thin Cython-based wrapper on top of libsystemd, focused on exposing the dbus API via sd-bus in an automated and easy to consume way.'
arch=('x86_64')
url='https://github.com/systemd/pystemd'
license=('LGPL2.1')
depends=('python' 'systemd' 'python-lxml' 'python-psutil')
makedepends=('python-setuptools' 'cython')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('dbf235bece19c68036e4be517a9675ab')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
