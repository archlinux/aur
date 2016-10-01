# Maintainer: 3ED <krzysztof1987 /at/ gmail /dot/ com>
# Contributor: jtts

pkgname=libreoffice-extension-languagetool
_pkgname=languagetool
pkgver=3.5
pkgrel=1
pkgdesc="An Open Source style and grammar checker (30 languages)"
arch=('any')
url="http://www.languagetool.org/"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice' 'java-runtime>=8')
source=("http://www.languagetool.org/download/LanguageTool-${pkgver}.oxt")
noextract=("LanguageTool-${pkgver}.oxt")
sha512sums=('1a36c04117c473ccb812f3b216763d816ddc796869488bfcf2f36d8ab325ef1620edf148ebb8b1b1b2d62a043b5b45f738e27ff440f6f99067601828a49f0e0e')

package() {
  _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}/"
  install -dm755 "${_DESTDIR}"
  bsdtar -xf LanguageTool-${pkgver}.oxt -C "${_DESTDIR}"
  chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
