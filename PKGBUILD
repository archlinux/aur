# Maintainer: Fabio Ambauen <fabio at dynamix-tontechnik dot ch>
_pkgname=crcon
pkgname="${_pkgname}-git"
pkgver=r11.94e1131
pkgrel=1
pkgdesc="C cli rcon app"
arch=('any')
url="https://github.com/naclander/crcon"
license=('GPL')
makedepends=('git')
source=("git+https://github.com/naclander/crcon.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${_pkgname}"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
  install -Dm755 crcon "$pkgdir/usr/local/bin/$_pkgname"
}
