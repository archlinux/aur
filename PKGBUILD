
# Maintainer: Aravinda Rao <maniacalace at popular google email dot com>
pkgname=qtile-bonsai
pkgver=0.3.0
pkgrel=1
epoch=
pkgdesc="A flexible layout for the qtile tiling window manager that allows arbitrarily nestable tabs/splits and rearrangements"
arch=('x86_64')
url="https://github.com/aravinda0/qtile-bonsai"
license=('MIT')
groups=()
depends=(
  python-psutil
  python-strenum
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
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
sha256sums=('b4577aabdbd1043ebf97d95e12f01e826d2620b2fd9c7de895bce1942d461679')
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
