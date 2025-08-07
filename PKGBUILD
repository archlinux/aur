# Contributor: Ward Segers <w@rdsegers.be>

pkgname=linmath
_commit=3eef82841046507e16a0f6194a61cee2eadd34b3
pkgver=71.3eef828
pkgrel=1
pkgdesc="lean linear math library, aimed at graphics programming"
arch=("any")
url="https://github.com/datenwolf/linmath.h"
license=('WTFPL')
makedepends=('git')
source=("git+${url}#commit=$_commit")
sha256sums=('1ea7ea7e6052ad674da1f2630263193ba739c60d20b5edb704f16bbfb555f073')

pkgver() {
  cd linmath.h
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd linmath.h
  gcc -o linmath_test $CFLAGS linmath_test.c $LDFLAGS -lm
  ./linmath_test
}

package() {
  cd linmath.h
  install -Dm644 "linmath.h" "${pkgdir}/usr/include/linmath.h"
}

