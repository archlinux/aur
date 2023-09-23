# Maintainer: Nils Amiet <amietn@foobar>
pkgname=vcsi
pkgver=7.0.16
pkgrel=1
pkgdesc="Create video contact sheets, thumbnails"
arch=(any)
url="https://github.com/amietn/vcsi"
license=('MIT')
groups=()
depends=(python ffmpeg python-numpy python-pillow python-jinja python-texttable ttf-dejavu python-parsedatetime python-setuptools)
makedepends=(git python-installer python-poetry)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${pkgname}::git+https://github.com/amietn/vcsi.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "${pkgname}"
  poetry build
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

