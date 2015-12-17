pkgbase=python-ntlm3
pkgname=('python-ntlm3' 'python2-ntlm3')
pkgver=1.0.2
pkgrel=1
pkgdesc="Allows Python clients running on any operating system to provide NTLM authentication to a supporting server."
arch=('any')
url="https://github.com/trustrachel/python-ntlm3"
license=('lgpl')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://pypi.python.org/packages/source/p/python-ntlm3/python-ntlm3-$pkgver.tar.gz)
md5sums=('94946f5e454ae555759d551c06db1be4')



build() {
    cd "$srcdir"/python-ntlm3-$pkgver
    python setup.py build
    python2 setup.py build
}


package_python-ntlm3() {
    cd "$srcdir"/python-ntlm3-$pkgver
    python setup.py install --skip-build -O1 --root="$pkgdir"
}

package_python2-ntlm3() {
    cd "$srcdir"/python-ntlm3-$pkgver
    python2 setup.py install --skip-build -O1 --root="$pkgdir"
}
