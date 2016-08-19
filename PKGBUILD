pkgname=python2-tldextract
pkgver=2.0.1
pkgrel=1
pkgdesc="Accurately separate the TLD from the registered domain andsubdomains of a URL, using the Public Suffix List."
arch=('any')
url="https://github.com/john-kurkowski/tldextract"
license=('BSD')
depends=('python2' 'python2-idna' 'python2-requests' 'python2-requests-file')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/f4/fd/f9995517d2fce9b4800680916c8ace079cf6ced8fb7ff84a301105d87668/tldextract-${pkgver}.tar.gz")
md5sums=('b5ac6436f4b25c802bb59d253848f897')

build() {
    cd "${srcdir}/tldextract-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/tldextract-${pkgver}"
    python2 setup.py install --root=${pkgdir} --optimize=1 --skip-build
}

