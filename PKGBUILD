# Maintainer: mochaaP <aur@mochaa.ws>

_pkgname=975maru
pkgname=ttf-${_pkgname}-git
pkgver=0.0.0.r20.gb7e6214
pkgrel=1
pkgdesc="A Chinese Font Derived from Source Han Sans / Swei Gothic."
arch=('any')
license=('OFL')
url="https://github.com/lxgw/${_pkgname}"
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" TTF\ SC/*.ttf

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
  install -Dm644 SIL_Open_Font_License_1.1.txt "${pkgdir}/usr/share/licenses/${pkgname%-git}/OFL.txt"
}

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "%s" "0.0.0.r$(git rev-list HEAD --count).g$(git log -1 --format=%h)"
}
