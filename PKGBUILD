# Maintainer: 3ED <krzysztof1987 /at/ gmail /dot/ com>
# Contributor: jtts

pkgname=libreoffice-extension-languagetool
_pkgname=languagetool
pkgver=3.1
pkgrel=1
pkgdesc="An Open Source style and grammar checker (30 languages)"
arch=('any')
url="http://www.languagetool.org/"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice')
source=("http://www.languagetool.org/download/LanguageTool-${pkgver}.oxt")
noextract=("LanguageTool-${pkgver}.oxt")
sha512sums=('9e41e34d6476bb799259ba4689c63704da24195ce46bb9c8055ce6264fbe706baacc9b84cd5bc870fdbe919f4ccfa2744fe19d40da68b121f8d95fc64e27114e')

package() {
  _DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}/"
  install -dm755 "${_DESTDIR}"
  bsdtar -xf LanguageTool-${pkgver}.oxt -C "${_DESTDIR}"
  chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
