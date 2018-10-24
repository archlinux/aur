# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
pkgname=safetynets-git
pkgver=d193964
pkgrel=1
pkgdesc="A framework to outsource machine-learning inference computation"
arch=("x86_64" "i686")
url="https://github.com/zghodsi/safetynests"
license=('custom:CC-BY-NC')
depends=()
source=("git+https://github.com/zghodsi/safetynets")
sha256sums=('SKIP')

pkgver() {
  cd safetynets
  git log -n1 --format=%h
}

build() {
  cd safetynets
  make 
}

check() {
  cd safetynets
  ./safetynets.o timit_arch.txt
}

package() {
  install -Dm755 "${srcdir}/safetynets/safetynets.o" "${pkgdir}/usr/bin/safetynets" 
}

# vim:set ts=2 sw=2 et:
