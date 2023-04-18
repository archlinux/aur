# Maintainer: Light Ning <lightning1141@gmail.com>

pkgname=columnq
_pkgname=columnq-cli
_pkgver=0.4.0
pkgver=$(echo $_pkgver | sed -e "s/\-/\./")
pkgrel=0
pkgdesc='Simple CLI to help you query tabular data with support for a rich set of growing formats and data sources.'
arch=('i686' 'x86_64')
url="https://github.com/roapi/roapi/tree/main/columnq-cli"
license=('Apache')
depends=('gcc-libs')
conflicts=('columnq')
provides=('columnq')
makedepends=('rust' 'git')
source=("git+https://github.com/roapi/roapi.git#tag=${_pkgname}-v${_pkgver}")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/roapi/${_pkgname}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/roapi/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/roapi/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
