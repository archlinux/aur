# Maintainer: User8395 <therealuser8395@proton.me>
pkgname=milou-git
_pkgname=milou
pkgver=6.6.90.r8.ge5d9186
pkgrel=1
pkgdesc="A dedicated search application built on top of Baloo"
arch=(any)
url='https://invent.kde.org/plasma/milou'
license=(LGPL)
conflicts=(milou)
groups=(plasma-git)
depends=(qt6-base qt6-declarative libplasma-git kconfig-git kcoreaddons-git kirigami-git krunner-git ksvg-git)
makedepends=(extra-cmake-modules-git git kdoctools-git)
source=("git+https://invent.kde.org/plasma/milou.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_pkgname
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
