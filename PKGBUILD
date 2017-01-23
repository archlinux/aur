_pypiname="delegator.py"
pkgbase="python-$_pypiname"
pkgname=("python-$_pypiname" "python2-$_pypiname")
pkgver=0.0.6
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
sha256sums=('de44ccf1bb06de917d9afc508b6931090ce0ab0d2beada941098fcdd73785052')
