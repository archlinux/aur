# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Previous maintainers:
#   Giovanni Scafora <giovanni at archlinux dot org>
#   damir <damir at archlinux dot org>
#
# Upstream: https://git.metalpunks.info/arch-ports

pkgname=mpck
pkgver=0.21
pkgrel=2
license=('GPL')
pkgdesc="Reads MP3 files and tries to determine if they are correct"
arch=('x86_64')
url="https://checkmate.gissen.nl"
depends=('glibc')
source=("https://checkmate.gissen.nl/checkmate-${pkgver}.tar.gz")
md5sums=('81d5d0b620f0fe3cc23c272021e9f23c')

build() {
  cd checkmate-${pkgver}

  ./configure --prefix=/usr
  make
}

package() {
  cd checkmate-${pkgver}

  make prefix="${pkgdir}/usr" install
}
