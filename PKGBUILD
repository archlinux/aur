# shellcheck disable=SC2034,SC2154,SC2164

# Maintainer:  JustKidding <jk@vin.ovh>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Alex Merry <dev@randomguy3.me.uk>

pkgname=python-stdnum
pkgver=1.20
pkgrel=1
pkgdesc="Handle, parse and validate standard numbers, e.g. IBAN, EAN, ISBN"
arch=('any')
url="http://arthurdejong.org/python-stdnum"
license=('LGPL-2.1-or-later')
depends=('python' 'python-requests' 'python-lxml' 'python-setuptools')
optdepends=(
    'python-zeep: recommended SOAP implementation'
    'python-suds: second recommended SOAP implementation'
    'python-pysimplesoap: fallback SOAP implementation'
)
source=("${pkgname}-${pkgver}.tar.gz::http://arthurdejong.org/python-stdnum/python-stdnum-${pkgver}.tar.gz")
sha256sums=('ad2a2cf2eb025de408210235f36b4ae31252de3186240ccaa8126e117cb82690')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

