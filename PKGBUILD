_pypiname="delegator.py"
pkgbase="python-delegator"
pkgname=("python-delegator" "python2-delegator")
pkgdesc="Subprocesses for Humans 2.0"
url="https://github.com/kennethreitz/delegator.py"
pkgver=0.0.14
pkgrel=1
source=("https://files.pythonhosted.org/packages/source/d/$_pypiname/$_pypiname-$pkgver.tar.gz")
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
sha256sums=('27eb1585935ee5dd297a133bf0d91edb4fe84cc5615750fbfbcd6222cc66cc2b')
