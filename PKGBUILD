pkgname=complex-dwm-slock-git
_pkgname=Complex_DWM_SLock
pkgver=0.r11.g5b95024
pkgrel=1
pkgdesc="An enhanced, secure, and visually appealing screen locker for DWM and other X11 environments."
arch=('x86_64')
url="https://github.com/fam007e/Complex_DWM_SLock"
license=('MIT')
depends=('libx11' 'libxext' 'libxrandr' 'libxft' 'imlib2' 'pam')
makedepends=('git' 'make' 'gcc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/fam007e/Complex_DWM_SLock.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
