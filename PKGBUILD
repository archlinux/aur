# Maintainer: Gunar C. Gessner <me@gunargessner.com>
_pkgname="reredirect"
pkgname="${_pkgname}-git"
pkgver=146
pkgrel=1
pkgdesc="Tool to dynamicly redirect outputs of a running process"
arch=("i686" "x86_64")
url="https://github.com/jerome-pouiller/reredirect"
license=('MIT')
groups=()
depends=('glibc')
makedepends=('git')
optdepends=()
provides=('reredirect')
conflicts=('reredirect')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+http://github.com/jerome-pouiller/${_pkgname}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git rev-list --count HEAD
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -D -m 644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
