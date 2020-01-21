# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-twitter3
pkgdesc="A Python wrapper around the Twitter API"
url="https://github.com/bear/python-twitter"

provides=('python-twitter')
conflicts=('python-twitter')

pkgver=3.5
pkgrel=2

arch=('any')
license=('Apache')

depends=(
    "python-requests-oauthlib"
    "python-future"
   )
makedepends=(
    "python-setuptools"
)

source=("https://github.com/bear/python-twitter/archive/v${pkgver}.tar.gz")
sha512sums=('51daf6be7eb1ee3e336b17ed161be9899bb84a2527decc512c0ea0d823ef2193359c239c0adf315e5116afd3be529aa99f8810c3580608071cd576d4e6e71f31')

build() {
  cd "${srcdir}/python-twitter-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/python-twitter-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}
