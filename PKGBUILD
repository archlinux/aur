# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

_extname=languagetool
pkgname=openoffice-extension-${_extname}
pkgver=5.0
pkgrel=1
pkgdesc="An Open Source style and grammar checker (more than 30 languages)"
arch=('any')
url="https://languagetool.org"
license=('LGPL')
groups=('openoffice-extensions')
depends=('openoffice' 'java-runtime>=8')
optdepends=('jre8-openjdk: java 8 or greater is required')
source=("https://www.languagetool.org/download/LanguageTool-${pkgver}.oxt")
noextract=("LanguageTool-${pkgver}.oxt")
sha512sums=('8493100684598aaa7c422360e0f00b5cff0c1be22aca4bee6c7e0e12d509916bc3c7f8df052b86702f6177ffffc227d1a5dbe6b2592fa1cbdb79f4666dc22c16')

package() {
  _DESTDIR="${pkgdir}/opt/openoffice4/share/extensions/${_pkgname}/"
  install -dm755 "${_DESTDIR}"
  bsdtar -xf LanguageTool-${pkgver}.oxt -C "${_DESTDIR}"
  chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
