# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=sowing
pkgver=1.1.26
pkgrel=1
pkgdesc="Tools for documenting and improving portability"
arch=(x86_64)
url="http://wgropp.cs.illinois.edu/projects/software/sowing/"
license=(GPL)
options=(!makeflags)
source=(${pkgname}-${pkgver}.tar.gz::"${url}/${pkgname}.tar.gz")
sha256sums=('5d04ebf56378c35272022c91092571099d8b0464000caa2b722e90bd954f92bd')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --datadir=/usr/share/sowing
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make prefix="${pkgdir}"/usr datadir="${pkgdir}"/usr/share/sowing install
}
