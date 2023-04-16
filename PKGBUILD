# Maintainer: Light Ning <lightning1141@gmail.com>

pkgname=svgbob
_pkgver=0.7.0
pkgver=$(echo $_pkgver | sed -e "s/\-/\./")
pkgrel=0
pkgdesc='Convert your ascii diagram scribbles into happy little SVG'
arch=('i686' 'x86_64')
url="https://github.com/ivanceras/svgbob"
license=('Apache')
depends=('gcc-libs')
conflicts=('svgbob')
provides=('svgbob')
makedepends=('rust' 'git')
# source=("${pkgname}::git+https://github.com/ivanceras/svgbob.git#tag=${_pkgver}")
source=("${pkgname}::git+https://github.com/ivanceras/svgbob.git#commit=6b3765c640d3ec306e026e99d1b93bee5f53799c")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/svgbob/packages/svgbob_cli"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/svgbob/target/release/svgbob_cli" "${pkgdir}/usr/bin/svgbob"
  install -Dm644 "${srcdir}/svgbob/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
