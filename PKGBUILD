# Maintainer: Niclas Meyer <niclas at countingsort dot com>

pkgbase=ats-acc
pkgname=$pkgbase-git
pkgver=r23.2d49f4e
pkgrel=1
pkgdesc="Pretty-print error messages of the ATS Compiler "
arch=('i686' 'x86_64')
url="https://github.com/sparverius/ats-acc"
license=('NONE')
depends=('ats2-postiats')
makedepends=()
provides=('ats-acc')
conflicts=('ats-acc')
source=("${pkgname}::git+https://github.com/sparverius/ats-acc.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 755 acc $pkgdir/usr/bin/acc
}
