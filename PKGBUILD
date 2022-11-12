_pkgname=libsmallfry
pkgname=${_pkgname}-git
pkgver=0.1.0.r0.g92f3938
pkgrel=1
pkgdesc='Smallfry metric for JPEG Optimization'
arch=(x86_64)
url="https://github.com/ImageProcessing-ElectronicPublications/${_pkgname}"
license=(BSD)
depends=()
makedepends=(git)
optdepends=()
provides=("${_pkgname}")
conflicts=(${provides[@]})
source=("${_pkgname}-git"::"git+https://github.com/ImageProcessing-ElectronicPublications/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}-git"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}-git"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-git"
  make PREFIX="$pkgdir/usr" install
}
