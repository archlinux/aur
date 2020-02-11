pkgname='python-dbus-next'
_module='dbus_next'
pkgver=0.1.2
pkgrel=1
pkgdesc='The next great DBus library for Python with asyncio support'
url=https://github.com/altdesktop/python-dbus-next
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provices=('python-dbus-next', 'dbus-next')
source=("https://files.pythonhosted.org/packages/source/d/dbus-next/${_module}-${pkgver}.tar.gz")
md5sums=('df838d695284dd1775860f9691a8663f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
