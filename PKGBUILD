# Maintainer: 3ED <krzysztof1987 /at/ gmail /dot/ com>
# Contributor: jtts

pkgname=libreoffice-extension-languagetool
_pkgname=languagetool
pkgver=3.2
pkgrel=1
pkgdesc="An Open Source style and grammar checker (30 languages)"
arch=('any')
url="http://www.languagetool.org/"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice')
source=("http://www.languagetool.org/download/LanguageTool-${pkgver}.oxt")
noextract=("LanguageTool-${pkgver}.oxt")
sha512sums=('33635511b1f1c4fab832f3d8dfdcd6c31481f56d9626696a5c2a8b5e99719c55203c9d054faa9d1db56e43de12e9f04256ef175dc1d2dbc843661c90f289858f')

package() {
  _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}/"
  install -dm755 "${_DESTDIR}"
  bsdtar -xf LanguageTool-${pkgver}.oxt -C "${_DESTDIR}"
  chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
