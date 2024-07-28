# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname=python-x3dh
pkgver=1.0.4
pkgrel=2
pkgdesc="A python implementation of the Extended Triple Diffie-Hellman key agreement protocol"
url="https://github.com/Syndace/${pkgname}"
license=('MIT')
arch=('any')
makedepends=(python-build python-installer python-wheel)
source=("${pkgname}_${pkgver}.zip::https://github.com/Syndace/${pkgname}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('3af698ecbc525cd3cfd798090df8636a18c1f28dbcfbb1ed4ebed9d78208c118')
depends=('python-xeddsa')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
