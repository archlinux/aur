pkgname='python-dbus-next'
_module='dbus_next'
pkgver=0.1.4
pkgrel=1
pkgdesc='The next great DBus library for Python with asyncio support'
url=https://github.com/altdesktop/python-dbus-next
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('python-dbus-next')
conflicts=('python-dbus-next-git')
source=("https://files.pythonhosted.org/packages/source/d/dbus-next/${_module}-${pkgver}.tar.gz")
md5sums=('0d44e12e8689637a0c048ec7bb51d842')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
