# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname=python-x3dh
pkgver=1.1.0
pkgrel=1
pkgdesc="A python implementation of the Extended Triple Diffie-Hellman key agreement protocol"
url="https://github.com/Syndace/${pkgname}"
license=('MIT')
arch=('any')
makedepends=(
		python-build
		python-installer
		python-setuptools
		python-wheel
)
source=("${pkgname}_${pkgver}.zip::https://github.com/Syndace/${pkgname}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('be7a67acee5375f0dfee44f28a4f5a7498b62fe3259f931fb1e0d13c67311f8f')
depends=('python-xeddsa')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
