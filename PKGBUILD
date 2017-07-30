_pypiname="delegator.py"
pkgbase="python-delegator"
pkgname=("python-delegator" "python2-delegator")
pkgdesc="Subprocesses for Humans 2.0"
url="https://github.com/kennethreitz/delegator.py"
pkgver=0.0.13
pkgrel=1
source=("https://github.com/kennethreitz/delegator.py/archive/v$pkgver.tar.gz")
makedepends=('python-setuptools' 'python2-setuptools')
license=("MIT")
arch=("any")

build() {
    cd "$srcdir"
    cp -r "$_pypiname-$pkgver" "$_pypiname-$pkgver-py2"
}

package_python-delegator() {
    depends=("python" "python-pexpect")
    conflicts=('python-delegator.py')
    provides=('python-delegator.py')
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py install --prefix="/usr" --root="$pkgdir" -O1
}

package_python2-delegator() {
    depends=("python2" "python2-pexpect")
    conflicts=('python2-delegator.py')
    provides=('python2-delegator.py')
    cd "$srcdir/$_pypiname-$pkgver-py2"
    python2 setup.py install --prefix="/usr" --root="$pkgdir" -O1
}
sha256sums=('01d05c985b62853c24e8b9f9873f18826c63f8a580d17cfa6feafa67d07e686c')
