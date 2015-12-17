pkgbase=python-requests-ntlm
pkgname=('python-requests-ntlm' 'python2-requests-ntlm')
pkgver=0.2.0
pkgrel=1
pkgdesc="Allows for HTTP NTLM authentication using the requests library"
arch=('any')
url="https://github.com/requests/requests-ntlm"
license=('custom')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://pypi.python.org/packages/source/r/requests_ntlm/requests_ntlm-$pkgver.tar.gz)
md5sums=('370688e60b5f51142c64adad027a29a2')



build() {
    cd "$srcdir"/requests_ntlm-$pkgver
    python setup.py build
    python2 setup.py build
}


package_python-requests-ntlm() {
    depends=('python-requests' 'python-ntlm3')

    cd "$srcdir"/requests_ntlm-$pkgver
    python setup.py install --skip-build -O1 --root="$pkgdir"
    install -m0644 -D "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-requests-ntlm() {
    depends=('python2-requests' 'python2-ntlm3')

    cd "$srcdir"/requests_ntlm-$pkgver
    python2 setup.py install --skip-build -O1 --root="$pkgdir"
}
