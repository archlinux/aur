# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=conciseST
pkgname=concisest
pkgver=1.0.3
pkgrel=1
pkgdesc="Concise Build of Suckless Simple Terminal"
arch=('x86_64')
url="https://gitlab.com/qYp/${_pkgname}"
license=('MIT')
depends=(gcc libxft-bgra-git)
makedepends=(git)
provides=(st)
conflicts=(st)
replaces=(st)
backup=(usr/bin/st.bak)
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "1.0.""$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  DESTDIR="$pkgdir" make
}

package() {
  cd ${_pkgname}           
  NAME="${_pkgname}" DESTDIR="${pkgdir}" make clean install
}

