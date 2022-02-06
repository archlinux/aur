# Contributor: 3ED_0 <krzysztofas at protonmail>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=openoffice-extension-languagetool
pkgver=5.6
pkgrel=1
_dl_id=19183
pkgdesc="An Open Source style and grammar checker (more than 30 languages)"
arch=('any')
url="https://languagetool.org"
license=('LGPL')
groups=('openoffice-extensions')
depends=('openoffice-bin' 'java-runtime>=8')
optdepends=('jre8-openjdk: java 8 or greater is required')
source=("LanguageTool-${pkgver}.oxt::https://extensions.openoffice.org/en/download/${_dl_id}")
noextract=("LanguageTool-${pkgver}.oxt")
sha512sums=('2856a941e71a2f357e5c89fcc3cbb5b3d49f363b0d934987824135473f9d0adc8f572101cef284b1d11ce45c2115b56add0431da24543530aa0020a98d265773')

package() {
  _DESTDIR="${pkgdir}/opt/openoffice4/share/extensions/${_pkgname}/"
  install -dm755 "${_DESTDIR}"
  bsdtar -xf LanguageTool-${pkgver}.oxt -C "${_DESTDIR}"
  chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
