# Maintainer: Harrison <htv04rules at gmail dot com>

pkgname=ctr-firm-builder-git
pkgver=r9.3dd773d
pkgrel=1
pkgdesc="A tool for building Nintendo 3DS FIRM containers"
arch=("x86_64" "i686" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/derrekr/ctr_firm_builder"
license=("GPL3")
makedepends=("git")
provides=("ctr-firm-builder")
conflicts=("ctr-firm-builder")
source=("git+https://github.com/derrekr/ctr_firm_builder")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/ctr_firm_builder"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  pushd "${srcdir}/ctr_firm_builder" > /dev/null
  make
  popd > /dev/null
}

package() {
  install -Dm0755 "${srcdir}/ctr_firm_builder/firm_builder" "${pkgdir}/usr/bin/firm_builder"
}
