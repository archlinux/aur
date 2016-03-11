# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=abricotine-bin
_binname=Abricotine
pkgver=0.3.0
pkgrel=1
pkgdesc="A markdown editor with inline preview"
arch=('i686' 'x86_64')
url="http://abricotine.brrd.fr"
license=('GPL3')
provides=('abricotine')
conflicts=('abricotine')
source_i686=("https://github.com/brrd/${_binname}/releases/download/${pkgver}/${_binname}-linux-ia32.zip")
source_x86_64=("https://github.com/brrd/${_binname}/releases/download/${pkgver}/${_binname}-linux-x64.zip")
sha256sums_i686=('475dcf07adcc2bf76a68b3bb48b6460071038c577daf38413b5a99f532c01dfc')
sha256sums_x86_64=('702c9255d10abc273e7b43c53f6d71c256b4984dcdb47e07a1a7b11617cec257')

package() {
  cd "${srcdir}/${_binname}-linux-"*

  install -d "${pkgdir}/opt/${_binname,,}"
  cp -ra * "${pkgdir}/opt/${_binname,,}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_binname,,}/${_binname}" "${pkgdir}/usr/bin/${_binname,,}"
}

# vim:set ts=2 sw=2 et:
