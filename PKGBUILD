# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : mickael9 <mickael9 at gmail dot com>


pkgname=wapiti

pkgver=3.0.3
pkgrel=2

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
sha256sums=('059f778453ebf05b38e9c6c837d3b3eb9b8921c8fdc6d4029df89f2b0e84f5b7')


build() {
    cd "$pkgname${pkgver:0:1}-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname${pkgver:0:1}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}


# vim: ts=4 sw=4 et ft=PKGBUILD:
