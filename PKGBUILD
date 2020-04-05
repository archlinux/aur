# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_commit=e581cd51611c948043fcc61d3720b2891fb390eb

pkgname=libspot
pkgver=1.2
pkgrel=1
pkgdesc='A C++ library which aims to detect anomalies in univariate streaming data.'
arch=(x86_64)
url='https://asiffer.github.io/libspot/'
license=(GPL)
depends=(glibc)
makedepends=()
options=()
source=(
  git+https://github.com/asiffer/libspot.git
)
sha256sums=('SKIP')

_srcdir=libspot

prepare() {
  cd $_srcdir
  git cherry-pick -n $_commit
}

build() {
  cd $_srcdir

  make
}

package() {
  cd $_srcdir

  make install DESTDIR="${pkgdir}"
}
