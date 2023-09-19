# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=mongars
pkgver=1.0.0
pkgrel=1
pkgdesc="Count inbox emails using Gnome Online Accounts or Google GMAIL API"
arch=('any')
url="https://github.com/chmouel/mongars"
license=('Apache')
optdepends=('gum' 'python-gobject' 'evolution-data-server')
depends=('python-google-api-core' 'python-google-api-python-client' 'python-google-auth' 'python-google-auth-httplib2' 'python-google-auth-oauthlib' 'python-googleapis-common-protos' 'pass')
source=(https://github.com/chmouel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('8638d4c4ef52cb91b59c0f5560205dce471cab0f92b987659d7323fbca255f46')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry-core')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
