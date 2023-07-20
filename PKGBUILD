# Maintainer: Homer Xing <homer dot hsing @t gmail dot com>

projname=flynt
pkgname=python-$projname
pkgver=1.0.0
pkgrel=0
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
b2sums=("38df027fff6d430f680f1d605f0ee7b19bcb52fdf6c31f463f20d73af1a6d0a3971174f1b36a4fb62c19110dc56a8805b00b47b3683d16fd1a59af3acc4c6bf0")

build() {
  cd "${srcdir}/${projname}-${pkgver}"
  python3 -m build
}

package() {
  cd "${srcdir}/${projname}-${pkgver}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}