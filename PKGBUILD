# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=seqcombgo-git
_pkgname=SeqCombGo
pkgver=r61.7abdfcb
pkgrel=1
pkgdesc="Sequence Combination tool written in Golang"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'arm')
url="https://github.com/MalacoLab/SeqCombGo"
license=('GPL')
makedepends=('go' 'git')
provides=('seqcombgo')
conflicts=('seqcombgo' 'seqcombgo-bin')
source=(git+https://github.com/MalacoLab/SeqCombGo.git)
sha256sums=('SKIP')
pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "$_pkgname"
  go build
}

package() {
  cd "$_pkgname"

  install -Dm755 $_pkgname $pkgdir/usr/bin/$_pkgname
}
