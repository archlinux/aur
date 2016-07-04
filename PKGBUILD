# Maintainer: Sindre Devik
_host=https://github.com/jergusg
_pkgname=k380-function-keys-conf
pkgname=$_pkgname-git
pkgver=r3.b1798b8
pkgrel=1
pkgdesc="Make function keys on Logitech K380 bluetooth keyboard default"
arch=('x86_64' 'i686')
url="${_host}/${_pkgname}"
license=('GPL')
groups=()
depends=('glibc')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${_pkgname}::git+${_host}/${_pkgname}")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  ./build.sh
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p           $pkgdir/usr/bin
  cp       k380_conf $pkgdir/usr/bin 
}

# vim:set ts=2 sw=2 et:
