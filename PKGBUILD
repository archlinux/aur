# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=watchpage
pkgver=0.4.1
pkgrel=1
pkgdesc="Watch webpages for changes"
url="https://www.muflone.com/watchpage"
arch=('any')
license=('GPL3')
depends=('python-yaml' 'python-beautifulsoup4' 'python-lxml' 'python-html5lib')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ae7e8122d03149f2e86bbcc1acf43e8401d7b9f80575356a374087d6632620cf')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
