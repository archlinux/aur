# Maintainer: Niki <nik@cock.lu>
_pkgname=binfetch
pkgname=binfetch-git
pkgver=0.1.r0.g4c63508
pkgrel=1
pkgdesc="Neofetch inspired utility for binaries. CC0"
arch=(x86_64 i686 aarch64 armv7)
url="https://socki.moe"
license=('CC0')
depends=(ib-git)
source=("git+https://github.com/Nik-Nothing/binfetch.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname

  make
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
