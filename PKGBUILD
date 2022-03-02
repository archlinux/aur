# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgbase=st
pkgname=st-nu1ll1nux
pkgver=1.0
pkgrel=1
pkgdesc="Concise Build of Suckless Simple Terminal"
arch=('x86_64')
url="https://gitlab.com/qYp/st"
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
  cd "${_pkgbase}"
  printf "1.0.""$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgbase}"           
  NAME="${pkgname}" DESTDIR="${pkgdir}" make clean install
}

