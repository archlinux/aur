
# Maintainer: Aravinda Rao <maniacalace at popular google email dot com>
pkgname=qtile-bonsai
pkgver=0.6.0
pkgrel=1
epoch=
pkgdesc="A flexible layout for the qtile tiling window manager that allows arbitrarily nestable tabs/splits and rearrangements"
arch=('x86_64')
url="https://github.com/aravinda0/qtile-bonsai"
license=('MIT')
groups=()
depends=(
  python-psutil
)
makedepends=(
  python-build
  python-installer
  python-uv-build
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/aravinda0/qtile-bonsai/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=("8440850b9f5120d993aa8a52228944b0254cb075a9a2cb7dcf17260e3ccf3414")
validpgpkeys=()


build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
