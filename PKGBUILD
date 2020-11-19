# Contributor: 3ED_0 <krzysztofas at protonmail>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

_extname=languagetool
pkgname=openoffice-extension-${_extname}
pkgver=5.1.3
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
sha512sums=('7a36e3b028b757c073d879ddd837ca12dc288178430bbf445080c892efe9f28d13565efd546e34244bcd8798ee0ef65433d08c8e3ee993b96efa4e5bbc103882')

package() {
  _DESTDIR="${pkgdir}/opt/openoffice4/share/extensions/${_pkgname}/"
  install -dm755 "${_DESTDIR}"
  bsdtar -xf LanguageTool-${pkgver}.oxt -C "${_DESTDIR}"
  chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
