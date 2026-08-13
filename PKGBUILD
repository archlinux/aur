# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=polypolish-bin
_pkgname=polypolish
pkgver=0.7.1
pkgrel=1
pkgdesc="Short-read polishing tool for bacterial genome assemblies"
arch=('x86_64')
url="https://github.com/rrwick/Polypolish"
license=('GPL-3.0-only')
provides=('polypolish')
conflicts=('polypolish')
options=('!strip' '!debug')
source=(
  "https://github.com/rrwick/Polypolish/releases/download/v${pkgver}/polypolish-linux-x86_64-musl-v${pkgver}.tar.gz"
  "https://raw.githubusercontent.com/rrwick/Polypolish/v${pkgver}/LICENSE"
)
sha256sums=('36d4aba0a3165103dbe31f533c5c7993b9027373a8674ea91b1c863307f9ca7e'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
