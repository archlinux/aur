# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Category: system

# Recommended build command: makepkg -scCfi

# https://groups.google.com/d/msg/comp.lang.postscript/Xne2G4pxbpM/c1btCIhZc2IJ

pkgname='pstext'
pkgver='1.1'
pkgrel='1'
pkgdesc='Convert text to postscript (Dan Judd 1989)'
arch=('i686' 'x86_64')
url='http://computer-programming-forum.com/36-postscript/f38cab32dcba8136.htm'
#license=('')
#depends=
#makedepends=
#optdepends=
source=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('a804475998ea7874a7a53c955855080f27db47451f25d54417320c96054ce2a0')
install="${pkgname}.install"

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
