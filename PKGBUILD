# Contributor: 3ED_0 <krzysztofas at protonmail>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=openoffice-extension-languagetool
pkgver=5.5.1
pkgrel=1
_dl_id=19176
pkgdesc="An Open Source style and grammar checker (more than 30 languages)"
arch=('any')
url="https://languagetool.org"
license=('LGPL')
groups=('openoffice-extensions')
depends=('openoffice-bin' 'java-runtime>=8')
optdepends=('jre8-openjdk: java 8 or greater is required')
source=("LanguageTool-${pkgver}.oxt::https://extensions.openoffice.org/en/download/${_dl_id}")
noextract=("LanguageTool-${pkgver}.oxt")
sha512sums=('bca1ea063bd06f55d1786175fdd0f0e8bf6ea4854d87a63e112ad93169da8b19c076938abb02fe650b5e88524211deedfffd2ba2c94d09be3e330bd2324c7f9e')

package() {
  _DESTDIR="${pkgdir}/opt/openoffice4/share/extensions/${_pkgname}/"
  install -dm755 "${_DESTDIR}"
  bsdtar -xf LanguageTool-${pkgver}.oxt -C "${_DESTDIR}"
  chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
