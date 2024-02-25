# Maintainer: Homer Xing <homer dot hsing @t gmail dot com>

projname=flynt
pkgname=python-$projname
pkgver=1.0.1
pkgrel=0
epoch=
pkgdesc="automatically convert old string literal formatting to f-strings"
arch=("any")
url="https://github.com/ikamensh/flynt"
license=("MIT")
groups=()
depends=("python" "python-astor")
makedepends=("python-build" "python-hatchling" "python-installer" "python-wheel")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/ikamensh/flynt/archive/refs/tags/$pkgver.tar.gz")
noextract=()
validpgpkeys=()
b2sums=("80f0516aa4c86d6491cb001e7060522619a98286d668cdd9924b22f1a2e07a029d92223101a2a5f283d6648fb485354844cb06fde1c34d95a670b10f7e8c41ed")

build() {
  cd "${srcdir}/${projname}-${pkgver}"
  python3 -m build --no-isolation --wheel
}

package() {
  cd "${srcdir}/${projname}-${pkgver}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
