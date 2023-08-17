# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=watchpage
pkgver=0.4.0
pkgrel=1
pkgdesc="Watch webpages for changes"
url="https://www.muflone.com/watchpage"
arch=('any')
license=('GPL3')
depends=('python-yaml' 'python-beautifulsoup4' 'python-lxml' 'python-html5lib')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8792246b68f0e07a88450ce5d255f9d8db94579a60e4fcaad300eb72894964ec')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
