_name=python-crontab
pkgname=('python-crontab' 'python2-crontab')
pkgver=2.5.1
pkgrel=1
pkgdesc='Crontab module for read and writing crontab files and accessing the system cron automatically and simply using a direct API.'
arch=('any')
url='https://pypi.python.org/pypi/python-crontab'
license=('LGPLv3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4bbe7e720753a132ca4ca9d4094915f40e9d9dc8a807a4564007651018ce8c31')

build_python-crontab() {
    cd "$srcdir/${pkgname}-$pkgver"
    python setup.py build
}

build_python2-crontab2() {
    cp -a ${pkgname}-$pkgver{,-py2}
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

