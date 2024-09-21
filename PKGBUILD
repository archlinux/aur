# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Benjamin Robin <dev@benjarobin.fr>
# Contributor: Otto VonStein <otto>

pkgname=pencil2d-git
pkgver=0.6.6.r506.g3d0a148
pkgrel=2
pkgdesc="Animation/drawing software, that lets you create traditional hand-drawn animation using both bitmap and vector graphics"
arch=(x86_64 i686)
url="https://github.com/pencil2d/pencil"
license=(GPL-2.0-only)
depends=(glibc gcc-libs qt5-base qt5-multimedia)
makedepends=(git qt5-svg qt5-tools)
provides=(pencil2d)
conflicts=(pencil2d)
source=("pencil2d::git+https://github.com/pencil2d/pencil.git")
sha256sums=('SKIP')

pkgver() {
  cd "pencil2d"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "pencil2d"
  qmake PREFIX=/usr
  make
}

package() {
  cd "pencil2d"
  make install INSTALL_ROOT="${pkgdir}"
}

