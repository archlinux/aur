# Maintainer: YeahSure <lapdogpdx.yahoo.com>

pkgname=filet-git
pkgver=r72.fe91316
pkgrel=1
pkgdesc="A fucking fast file manager for your terminal"
arch=('i686' 'x86_64')
url="https://github.com/buffet/filet"
license=('MPL')
depends=()
makedepends=('git')
conflicts=('filet')
provides=('filet')
source=("${pkgname}::git+https://github.com/buffet/filet.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" PREFIX=/usr make install
}
