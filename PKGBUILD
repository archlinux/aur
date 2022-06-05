# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
pkgname=libgdsii-git
pkgdesc='C++ library for working with GDSII binary data files'
pkgver=20190411
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/HomerReid/libGDSII"
license=('GPL2')
depends=('gcc-libs')
provides=("libgdsii=${pkgver}")
optdepends=()
makedepends=('git')
options=(!emptydirs)
source=('libgdsii::git+https://github.com/HomerReid/libGDSII')
md5sums=('SKIP')

pkgver() {
  cd libgdsii
  git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
  cd libgdsii
  sh autogen.sh --prefix='/usr'
}

package() {
  cd libgdsii
  make install DESTDIR="${pkgdir}"
}

# vim: fileencoding=utf-8 spelllang=en shiftwidth=2 expandtab
