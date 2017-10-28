_name=python-crontab
pkgname=('python-crontab' 'python2-crontab')
pkgver=2.2.6
pkgrel=2
pkgdesc='Crontab module for read and writing crontab files and accessing the system cron automatically and simply using a direct API.'
arch=('any')
url='https://pypi.python.org/pypi/python-crontab'
license=('LGPLv3')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('f693625b47cba7257ec68c1b2dd2794e')

build() {
    cd "$srcdir/${pkgname}-$pkgver"
    python setup.py build
  
    cd "$srcdir/${pkgname}-$pkgver-py2"
    python2 setup.py build
}

package_python-crontab() {
    depends=('python' 'python-dateutil')
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-crontab() {
    depends=('python2' 'python2-dateutil')
    cd "$srcdir/$_name-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}

