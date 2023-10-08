# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=sowing
_pkgver=1.1.26-p8
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Tools for documenting and improving portability"
arch=(x86_64)
url="http://wgropp.cs.illinois.edu/projects/software/sowing/"
license=(GPL)
depends=(bash gcc-libs glibc perl)
options=(!makeflags)
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/petsc/pkg-sowing/get/v${_pkgver}.tar.gz)
sha256sums=('d0b2def6f4f5c629aa67b0c2fdbb811c82aeadb3b06f22aa0a5decb50b17d069')

prepare() {
  mv petsc-pkg-sowing-* ${pkgname}-${pkgver}
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --datadir=/usr/share/sowing
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make prefix="${pkgdir}"/usr datadir="${pkgdir}"/usr/share/sowing install
}
