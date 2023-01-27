_name=python-crontab
pkgname=python-crontab
pkgver=2.7.1
pkgrel=1
pkgdesc='Crontab module for read and writing crontab files and accessing the system cron automatically and simply using a direct API.'
arch=('any')
url='https://pypi.python.org/pypi/python-crontab'
license=('LGPLv3')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b21af4647c7bbb848fef2f020616c6b0289dcb9f94b4f991a55310ff9bec5749')

build_python-crontab() {
    cd "$srcdir/${pkgname}-$pkgver"
    python setup.py build
}

package_python-crontab() {
    depends=('python' 'python-dateutil')
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

