# Maintainer: Ashe Sterling <ashe.sterling@outlook.com>
pkgname=clrblk
pkgver=1.0.4
pkgrel=2
pkgdesc="A simple utility to show and test pretty (and not so pretty) colors in the terminal."
arch=('x86_64')
url="https://gitlab.com/ashe.sterling/clrblk"
license=('WTFPL-2-or-later')
depends=()
makedepends=('rust' 'cargo')
source=("${pkgname}-v${pkgver}.tar.gz::https://gitlab.com/ashe.sterling/clrblk/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('8a5e6818baab98000bbb63f05b93fefdd448780b91335b076175abdd4a5edfbc')

build() {
  cd "$srcdir/${pkgname}-v${pkgver}"
  cargo build --release
}

package() {
  cd "$srcdir/${pkgname}-v${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE                "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
