# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : mickael9 <mickael9 at gmail dot com>


pkgname=wapiti

pkgver=3.0.5
pkgrel=1

pkgdesc='A comprehensive web app vulnerability scanner written in Python'
arch=('any')
url="http://$pkgname.sourceforge.net"
license=('GPL')

makedepends=('python-setuptools' 'python-pip')
depends=('python-requests' 'python-beautifulsoup4' 'python-lxml' 'python-tld' 'python-yaswfp'
         'python-mako' 'python-python_socks' 'python-browser-cookie3' 'python-httpx' 'python-httpx-socks')
optdepends=('python-requests-kerberos: Kerberos authentication'
            'python-requests-ntlm: NTLM authentication')

options=('zipman')

changelog=ChangeLog
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname${pkgver:0:1}-$pkgver.tar.gz")
sha256sums=('e039a593d033f58d7293173c2d4c4565b38fbb7c63fda3278a9dcb978e399d49')


prepare() {
    rm -rf "$pkgname${pkgver:0:1}-$pkgver/tests"
}

build() {
    cd "$pkgname${pkgver:0:1}-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname${pkgver:0:1}-$pkgver"
    PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}


# vim: ts=4 sw=4 et ft=PKGBUILD:
