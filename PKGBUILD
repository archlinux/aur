# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname=python-x3dh
pkgver=1.0.3
pkgrel=1
pkgdesc="A python implementation of the Extended Triple Diffie-Hellman key agreement protocol"
url="https://github.com/Syndace/${pkgname}"
license=('MIT')
arch=('any')
makedepends=(python-build python-installer python-wheel)
source=("${pkgname}_${pkgver}.zip::https://github.com/Syndace/${pkgname}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('e968169027374ed05a4eed96ef6ee966ba80140b7ba24b4f721c11ca307ae2ed')
depends=('python-xeddsa')

build() {
  cd ${pkgname}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
