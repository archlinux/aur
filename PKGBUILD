# Maintainer: Aniket Pradhan <aniket17133[at]iiitd[dot]ac[dot]in>
# Contributer: Roman Haritonov <reclosedev[at]gmail[dot]com>

_pkgname="requests-cache"
pkgname="python-requests-cache"
pkgver=0.5.0
pkgrel=1
pkgdesc="Transparent persistent cache for http://python-requests.org/ library."
arch=("x86_64")
url="https://github.com/reclosedev/requests-cache"
license=("BSD")
depends=("python" "python-requests")
makedepends=("git" "python-setuptools")
provides=("python-requests-cache")
conflicts=("python2-requests-cache")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/reclosedev/requests-cache/archive/v${pkgver}.tar.gz")
sha256sums=('7846f008cd09ee1d38b5285bf098f9f0246cd1019d8c519d23184c1616342217')

build() {
  cd "$srcdir/$_pkgname-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}
