# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=typeinc
pkgver=1.0.3
pkgrel=1
pkgdesc="Ncurses typing speed test with difficulty levels"
arch=('any')
url="https://github.com/anirudhg07/typeinc"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/anirudhg07/typeinc/archive/v${pkgver}.tar.gz")
sha256sums=('4dd22c823bac1c72120baeb360b2ae904c183b2e4d0631a28c453b7d2a1ab6ba')

build() {
  cd "Typeinc-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "Typeinc-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
