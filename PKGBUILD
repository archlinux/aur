# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=watchpage
pkgver=0.2.0
pkgrel=1
pkgdesc="Watch webpages for changes"
url="https://www.muflone.com/watchpage"
arch=('any')
license=('GPL3')
depends=('python-yaml' 'python-beautifulsoup4' 'python-lxml' 'python-html5lib')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4e606e63bc2a9f7953ae2374a3c34877a0d0feafb58be307a7305b8a1b3a7306')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
