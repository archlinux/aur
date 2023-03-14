# Maintainer: exkc <exxxxkc@getgoogleoff.me>
# Co-Maintainer: Niki <nik@cock.lu>
_pkgname=binfetch
pkgname=binfetch-git
pkgver=0.1.r0.g4c63508
pkgrel=1
pkgdesc="Neofetch inspired utility for binaries. CC0"
arch=(x86_64 i686 aarch64 armv7)
url="https://socki.moe"
license=('CC0')
depends=(ib-git)
source=("${_pkgname}::git+https://github.com/Nik-Nothing/binfetch.git")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname

  make PREFIX=/usr
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
