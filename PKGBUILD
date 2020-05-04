# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-meilisearch
pkgver=0.10.0
pkgrel=1
pkgdesc='Python client for MeiliSearch API'
arch=(any)
license=('MIT')
url='https://pypi.org/project/meilisearch/'
depends=(python)
makedepends=(python-requests)
checkdepends=('python-pytest' 'python-pytest-ordering')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/meilisearch/meilisearch-python/archive/v${pkgver}.tar.gz)
sha512sums=('e2b03834fd834c6f1c77f7e23a86b8743cece92dbf781d7e6bd165fbc3f7e05d19c40b1b755627dca56253474b16a87806114248b406bafc825ef9b4157f5702')

build() {
  cd "meilisearch-python-${pkgver}"
  python setup.py build
}

package() {
  cd "meilisearch-python-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
