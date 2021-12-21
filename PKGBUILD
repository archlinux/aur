# Maintainer: Light Ning <lightning1141@gmail.com>

pkgname=svgbob
_pkgver=0.6.2
pkgver=$(echo $_pkgver | sed -e "s/\-/\./")
pkgrel=1
pkgdesc='Convert your ascii diagram scribbles into happy little SVG'
arch=('i686' 'x86_64')
url="https://github.com/ivanceras/svgbob"
license=('Apache')
depends=('gcc-libs')
conflicts=('svgbob')
provides=('svgbob')
makedepends=('rustup' 'git')
source=("${pkgname}::git+https://github.com/ivanceras/svgbob.git#tag=${_pkgver}")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/svgbob/packages/cli"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/svgbob/target/release/svgbob" "${pkgdir}/usr/bin/svgbob"
  install -Dm644 "${srcdir}/svgbob/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
