# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : mickael9 <mickael9 at gmail dot com>


pkgname=wapiti

pkgver=3.0.4
pkgrel=1

pkgdesc='A comprehensive web app vulnerability scanner written in Python'
arch=('any')
url="http://$pkgname.sourceforge.net"
license=('GPL')

makedepends=('python-setuptools' 'python-pip')
depends=('python-requests' 'python-beautifulsoup4' 'python-lxml' 'python-tld'
         'python-yaswfp' 'python-mako' 'python-pysocks')
optdepends=('python-requests-kerberos: Kerberos authentication'
            'python-requests-ntlm: NTLM authentication')

options=('zipman')

changelog=ChangeLog
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname${pkgver:0:1}-$pkgver.tar.gz")
sha256sums=('8b696753a37506f0c3e8f542cb60e9f8198bb1bafd1a1dc97fbb9592becf31f3')


prepare() {
    rm -rf "$pkgname${pkgver:0:1}-$pkgver/tests"
}

build() {
    cd "$pkgname${pkgver:0:1}-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname${pkgver:0:1}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}


# vim: ts=4 sw=4 et ft=PKGBUILD:
