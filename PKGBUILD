# Maintainer: Homer Xing <homer dot hsing @t gmail dot com>

projname=flynt
pkgname=python-$projname
pkgver=1.0.6
pkgrel=0
epoch=
pkgdesc="automatically convert old string literal formatting to f-strings"
arch=("any")
url="https://github.com/ikamensh/flynt"
license=("MIT")
groups=()
depends=("python" "python-astor")
makedepends=("python-build" "python-hatchling" "python-hatch-vcs" "python-installer" "python-wheel")
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
b2sums=("c0c2bb64e15a31faf1a224dea60a09455de5fad4f079efed0365ef0dbefa2e8ee29af28f77f38cb56ce19700d43df80b58564a991641fe170ea61629b762c747")

build() {
  cd "${srcdir}/${projname}-${pkgver}"
  python3 -m build --no-isolation --wheel
}

package() {
  cd "${srcdir}/${projname}-${pkgver}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
