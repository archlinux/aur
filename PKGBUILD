# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=odin

pkgname=odin-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="A fast, concise, readable, pragmatic and open sourced programming language."
arch=('x86_64')
url="https://odin-lang.org/"
license=('BSD-2-Clause')
depends=('llvm' 'clang')
provides=('odin')
conflicts=('odin')
source=(
  "https://github.com/odin-lang/Odin/releases/download/v${pkgver}/${_srcname}-v${pkgver}-linux-amd64.tar.gz"
)
sha256sums=(
  'd934d95a080cd24fcff67ede00117bd8fde4de7110214cbb7138b7a74b22b552'
)

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${_srcname}"

  cd "${srcdir}/${_srcname}-v${pkgver}-linux-amd64/"

  cp odin "${pkgdir}/usr/lib/${_srcname}/odin"
  cp -r core "${pkgdir}/usr/lib/${_srcname}/core"

  ln -s "/usr/lib/${_srcname}/odin" "${pkgdir}/usr/bin/odin"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_srcname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_srcname}/LICENSE"
}
