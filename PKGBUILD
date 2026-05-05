# Maintainer: BangL <henno.rickowski@gmail.com>
pkgname=ubercursor-git
_pkgname=ubercursor
pkgver=r17.1e22fd6
pkgrel=1
pkgdesc="This is a hack based fork of swcursor to replicate mouse overlays on linux."
arch=('x86_64')
url="https://github.com/BangL/ubercursor"
license=('GPL-3.0')
options=(!lto)
depends=('gtk3' 'libx11' 'libxext')
makedepends=('git')
provides=("ubercursor")
conflicts=("ubercursor")
source=("git+https://github.com/BangL/ubercursor.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/ubercursor"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/ubercursor"
  make
}

package() {
  cd "${srcdir}/ubercursor"
  install -Dm755 ubercursor "${pkgdir}/usr/bin/ubercursor"
}
