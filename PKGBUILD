pkgname='python-dbus-next'
_module='dbus_next'
pkgver=0.2.2
pkgrel=1
pkgdesc='The next great DBus library for Python with asyncio support'
url=https://github.com/altdesktop/python-dbus-next
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('python-dbus-next')
conflicts=('python-dbus-next-git')
source=("https://files.pythonhosted.org/packages/cb/fb/5ab0485c6460e39be75e16af95c0e23c2531c1ac5a482fffb9ee7d576e6f/dbus_next-0.2.2.tar.gz")
md5sums=('fcf7443b379ef69f95727bec0221ebc9')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
