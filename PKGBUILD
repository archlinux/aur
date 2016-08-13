# Maintainer: orumin <dev@orum.in>

pkgname=sprout-git
pkgdesc="C++11/14 constexpr based Containers, Algorithms, Random numbers, Parsing, Ray tracing, Synthesizer, and others."
pkgver=r1040.fea5e75
pkgrel=1
license=('custom:boost')
arch=('i686' 'x86_64')
url="https://github.com/bolero-MURAKAMI/Sprout"
depends=('boost')
makedepends=('git')
optdepends=('opencv')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}"

  install -dm 755 "${pkgdir}/usr/include"
  cp -pr "${pkgname}/sprout" "${pkgdir}/usr/include/sprout"
}
