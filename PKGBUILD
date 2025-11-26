# Maintainer: CreamSodass <greatvaluecreamsoda@gmail.com>

pkgname=ffvship
pkgrel=1
pkgver=4.0.0.21.g5308ad8
pkgdesc="Cli tool for computing the metric difference between two videos (GIT version)"
arch=('x86_64')
url='https://github.com/Line-fr/Vship'
license=('MIT')
depends=('ffms2' 'libvship')
makedepends=('git' 'make')
provides=("ffvship")
conflicts=("ffvship")
source=("ffvship::git+https://github.com/Line-fr/Vship.git")
sha256sums=('SKIP')

build() {
  cd "ffvship"

  make buildFFVSHIP
}

pkgver() {
  cd "${srcdir}/ffvship"
  # Generate pkgver like: v3.0.0.0.g7cd1d4f
  git describe --tags --long | sed 's/^v//;s/-/./g'
}

package(){
  cd "ffvship"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
