# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=termkeyboard-git
_pkgname=termkeyboard
pkgver=r14.8e310a0
pkgrel=1
pkgdesc="A program to inject keyboard events through terminal (git)"
url="https://github.com/chaitu236/TermKeyboard"
depends=('libtermkey')
license=('GPL')
arch=('x86_64' 'i686')
source=("${pkgname}"::'git+https://github.com/chaitu236/TermKeyboard.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname}
  make
}

package() {
  cd ${srcdir}/${pkgname}
  install -Dm644 kbd "${pkgdir}/usr/bin/kbd"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
