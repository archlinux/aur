# Maintainer: gbr <gbr@protonmail.com>
_pkgname=vibrantlinux
pkgname=vibrantlinux-git
pkgrel=1
pkgdesc='vibranceGUI replacement for Linux'
arch=('x86_64')
url='https://github.com/libvibrant/vibrantlinux'
license=('MIT')
depends=('qt5-base' 'libvibrant')
makedepends=('git')
conflicts=('vibrantlinux')
provides=('vibrantlinux')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')
pkgver=2.1.7.r0.ga75092b

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  qmake
  make
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
}
