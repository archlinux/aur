_pypiname="delegator.py"
pkgbase="python-$_pypiname"
pkgname=("python-$_pypiname" "python2-$_pypiname")
pkgver=0.0.7
pkgrel=1
source=("https://github.com/kennethreitz/delegator.py/archive/v$pkgver.tar.gz")
license=("MIT")
arch=("any")

build() {
    cd "$srcdir"
    cp -r "$_pypiname-$pkgver" "$_pypiname-$pkgver-py2"
}

package_python-delegator.py() {
    depends=("python" "python-pexpect")
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py install --prefix="/usr" --root="$pkgdir" -O1
}

package_python2-delegator.py() {
    depends=("python2" "python2-pexpect")
    cd "$srcdir/$_pypiname-$pkgver-py2"
    python2 setup.py install --prefix="/usr" --root="$pkgdir" -O1
}
sha256sums=('05c53bcf0e1f2eaabfc8121b3886f3fbaf9cd05b726bdf384775622bddf868c5')
