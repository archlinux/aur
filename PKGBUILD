# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=conciseST
pkgname=concisest
pkgver=1.0.5
pkgrel=1
pkgdesc="Concise Build of Suckless Simple Terminal"
arch=('x86_64')
url="https://gitlab.com/qYp/${_pkgname}"
license=('MIT')
depends=(gcc )
optdepends=(
    'libcurl: for curl'
    'python-lolcat: for colorfull shell headers'
  )
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

package() {
  cd ${_pkgname}           
  NAME="${_pkgname}" DESTDIR="${pkgdir}" make clean install
}

