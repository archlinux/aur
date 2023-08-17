# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=watchpage
pkgver=0.3.0
pkgrel=1
pkgdesc="Watch webpages for changes"
url="https://www.muflone.com/watchpage"
arch=('any')
license=('GPL3')
depends=('python-yaml' 'python-beautifulsoup4' 'python-lxml' 'python-html5lib')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('769cdeb4356948aee41bb0c5e4d3d5d857399f9f2fba90cd022bca7fefab017d')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
