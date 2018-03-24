pkgname=lwt-git
_pkgname=lwt
pkgver=2018_02_21
pkgrel=1
pkgdesc="Lightweight terminal emulator based on the VTE and GTK libraries."
url="https://github.com/mewkiz/lwt"
arch=('x86_64' 'i686')
license=('public domain')
depends=('gtk3' 'vte3' 'iniparser')
makedepends=('git')
conflicts=('lwt')
install=${pkgname}.install
source=("git+https://github.com/mewkiz/lwt.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git log -1 --format="%cd" --date="format:%Y_%m_%d"
}

build() {
  cd ${srcdir}/${_pkgname}
  make
}

package() {
  cd ${srcdir}/${_pkgname}
  make DESTDIR="$pkgdir/usr" install
}
