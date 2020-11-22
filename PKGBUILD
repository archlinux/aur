pkgname='python-dbus-next'
_module='dbus_next'
pkgver=0.2.1
pkgrel=1
pkgdesc='The next great DBus library for Python with asyncio support'
url=https://github.com/altdesktop/python-dbus-next
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('python-dbus-next')
conflicts=('python-dbus-next-git')
source=("https://files.pythonhosted.org/packages/34/22/c35fa9133819b60f9597280a895a0926b8c71ec0b54ffee506caabffb453/dbus_next-0.2.1.tar.gz")
md5sums=('1e89e42fc7d263b94ba2f7488a892537')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
