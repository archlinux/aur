# Maintainer: Niki <nik@cock.lu>
_pkgname=ibranching
pkgname=ib-git
pkgver=0.1.r1.g905836f
pkgrel=1
pkgdesc=""
arch=(x86_64 i686 aarch64 armv7)
url="https://socki.moe"
license=('CC0')
source=("git+https://github.com/Nik-Nothing/ibranching.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  make bootstrap
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" PREFIX=/usr  install
}
