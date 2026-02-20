# Maintainer: Winux <winux@winux.cc>

pkgname=rtk-ir-tools-git
_pkgname=rtk-ir-tools
pkgver=r3.0f0eacd
pkgrel=1
pkgdesc="Tools and hooks to initialize Dell Realtek IR camera emitters"
arch=('x86_64')
url="https://github.com/mrwinux/rtk-ir-tools"
license=('GPL')
depends=('pam' 'glibc')
makedepends=('gcc' 'make')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
