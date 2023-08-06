# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=watchpage
pkgver=0.1.2
pkgrel=1
pkgdesc="Watch webpages for changes"
url="https://www.muflone.com/watchpage"
arch=('any')
license=('GPL3')
depends=('python-yaml' 'python-beautifulsoup4' 'python-lxml' 'python-html5lib')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('38e46bf626ea53eab3147d4b60a67db0b34bf2c7389c625ac265c0d33ebe6d37')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
