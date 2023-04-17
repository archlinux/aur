# Maintainer: Homer Xing <homer dot hsing @t gmail dot com>

projname=flynt
pkgname=python-$projname
pkgver=0.78
pkgrel=1
epoch=
pkgdesc="automatically convert old string literal formatting to f-strings"
arch=("any")
url="https://github.com/ikamensh/flynt"
license=("MIT")
groups=()
depends=("python" "python-astor")
makedepends=("python-build" "python-installer")
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
b2sums=("9e59b7eafee720cc7a4ee07751ea9a892b0c9f5c8ef466dff9725823765442b017a0ebbfa9d98293ee0f92ffedf53dfdf8520245581611e3317a0802a9fa87fc")

build() {
  cd "${srcdir}/${projname}-${pkgver}"
  python3 -m build
}

package() {
  cd "${srcdir}/${projname}-${pkgver}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}