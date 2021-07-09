# Contributor: 3ED_0 <krzysztofas at protonmail>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=openoffice-extension-languagetool
pkgver=5.4
pkgrel=1
_dl_id=19165
pkgdesc="An Open Source style and grammar checker (more than 30 languages)"
arch=('any')
url="https://languagetool.org"
license=('LGPL')
groups=('openoffice-extensions')
depends=('openoffice-bin' 'java-runtime>=8')
optdepends=('jre8-openjdk: java 8 or greater is required')
source=("LanguageTool-${pkgver}.oxt::https://extensions.openoffice.org/en/download/${_dl_id}")
noextract=("LanguageTool-${pkgver}.oxt")
sha512sums=('bfa05d8c834234e1313227cf161292987651c1abba49abbd50b1d2ce348ddec6b611c779278ac49e7482599262ac86830165ed51d4811f224bddc5bdda12d885')

package() {
  _DESTDIR="${pkgdir}/opt/openoffice4/share/extensions/${_pkgname}/"
  install -dm755 "${_DESTDIR}"
  bsdtar -xf LanguageTool-${pkgver}.oxt -C "${_DESTDIR}"
  chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
