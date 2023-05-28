# Maintainer: Kyle Laker <kyle+aur at laker dot email>
pkgname='python-pystemd'
_name="${pkgname#python-}"
pkgver='0.13.2'
pkgrel=1
pkgdesc='A thin Cython-based wrapper on top of libsystemd, focused on exposing the dbus API via sd-bus in an automated and easy to consume way.'
arch=('x86_64')
url='https://github.com/systemd/pystemd'
license=('LGPL2.1')
depends=('python' 'systemd' 'python-lxml' 'python-psutil')
makedepends=('python-setuptools' 'cython')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('201e00956a44be251f5e4646a865d21c')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
