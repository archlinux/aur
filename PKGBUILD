# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : mickael9 <mickael9 at gmail dot com>


pkgname=wapiti

pkgver=3.0.2
pkgrel=1

pkgdesc='A comprehensive web app vulnerability scanner written in Python'
arch=('any')
url='http://wapiti.sourceforge.net/'
license=('GPL')

depends=('python-requests' 'python-beautifulsoup4' 'python-lxml' 'python-tld'
         'python-yaswfp' 'python-mako' 'python-pysocks')
optdepends=('python-requests-kerberos: Kerberos authentication'
            'python-requests-ntlm: NTLM authentication')
makedepends=('python-setuptools')

options=('zipman')

changelog=ChangeLog
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname${pkgver:0:1}-$pkgver.tar.gz")
sha256sums=('df86cab9f66c7794cab54fede16029056a764f5da565b2695524f9bd2bc9a384')


build() {
    cd "$pkgname${pkgver:0:1}-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname${pkgver:0:1}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
