# Maintainer: AsamK <asamk@gmx.de>
pkgname=git-absorb
pkgver=0.3.0
pkgrel=1
pkgdesc="git commit --fixup, but automatic "
arch=('i686' 'x86_64')
url="https://github.com/tummychow/git-absorb"
license=('BSD')
depends=(
)
makedepends=(
  'cargo'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tummychow/git-absorb/archive/${pkgver}.tar.gz")
sha256sums=('94d540a7febd37cd74e95e7cab71ee3514df020989208ce3fe83560699072730')

build() {
  cd "${pkgname}-${pkgver}"

  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 target/release/"${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
