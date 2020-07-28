# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=waybackpack
pkgver=0.3.6
pkgrel=1
pkgdesc='Download the entire Wayback Machine archive for a given URL'
arch=('any')
url='https://github.com/jsvine/waybackpack'
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('85b36d8bf7a17fd7d0ac39a112e078f97a2d1fa7d67c53414690efa2cb203fc6')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
