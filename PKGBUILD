# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=seqcombgo
_pkgname=SeqCombGo
pkgver=0.0.1
pkgrel=1
pkgdesc="Sequence Combination tool written in Golang"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'arm')
url="https://github.com/MalacoLab/SeqCombGo"
license=('GPL')
makedepends=('go')
provides=('seqcombgo')
conflicts=('seqcombgo-git' 'seqcombgo-bin')
source=(https://github.com/MalacoLab/SeqCombGo/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('a07562d0660314c41bb83e8f077dddb8fb536a943a826062f4fb8f0feac8a925')
build() {
  cd "$_pkgname-$pkgver"
  go build
}

package() {
  cd "$_pkgname-$pkgver"

  install -Dm755 $_pkgname $pkgdir/usr/bin/$_pkgname
}
