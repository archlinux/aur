# Maintainer: gwen <me@gwendolyn.dev>
pkgname=ycg
pkgver=1.0.0
pkgrel=1
pkgdesc="merges and templates yaml files"
arch=(any)
url="https://github.com/racccoooon/ycg"
license=('MIT')
depends=(
  'python'
  'python-yaml'
  'python-jinja'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('6a6a5049742b8d35531735a0c8d960f9015b1b0404975050ad59a525d5bb412b')


build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}


package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
