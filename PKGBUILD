# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=abricotine-bin
_binname=Abricotine
pkgver=0.2.2
pkgrel=1
pkgdesc="A markdown editor for desktop"
arch=('i686' 'x86_64')
url="http://abricotine.brrd.fr"
license=('GPL3')
provides=('abricotine')
conflicts=('abricotine')
source_i686=("https://github.com/brrd/${_binname}/releases/download/${pkgver}/${_binname}-linux-ia32.zip")
source_x86_64=("https://github.com/brrd/${_binname}/releases/download/${pkgver}/${_binname}-linux-x64.zip")
sha256sums_i686=('be91a67d6a7b6c51963d0723e5464c2b350d23278028161f004b76748e387e60')
sha256sums_x86_64=('db4189d97dabee6f9394338a104f1ddeb169c5f80bf8afdea0dbe80c209cad08')

package() {
  cd "${srcdir}/${_binname}-linux-"*

  install -d "${pkgdir}/opt/${_binname,,}"
  cp -ra * "${pkgdir}/opt/${_binname,,}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_binname,,}/${_binname}" "${pkgdir}/usr/bin/${_binname,,}"
}

# vim:set ts=2 sw=2 et:
