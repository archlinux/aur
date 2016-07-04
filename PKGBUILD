# Maintainer: 3ED <krzysztof1987 /at/ gmail /dot/ com>
# Contributor: jtts

pkgname=libreoffice-extension-languagetool
_pkgname=languagetool
pkgver=3.4
pkgrel=1
pkgdesc="An Open Source style and grammar checker (30 languages)"
arch=('any')
url="http://www.languagetool.org/"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice')
source=("http://www.languagetool.org/download/LanguageTool-${pkgver}.oxt")
noextract=("LanguageTool-${pkgver}.oxt")
sha512sums=('29eda8c4a26eb4da4dce68db6f962c8a8828bb0eb76aef3e31a58607aea9a15705aaccc4a1bc5366760bdb00c9133ef225291941e5873cbcc384627464eb9a8f')

package() {
  _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}/"
  install -dm755 "${_DESTDIR}"
  bsdtar -xf LanguageTool-${pkgver}.oxt -C "${_DESTDIR}"
  chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
