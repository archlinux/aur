# Contributor: 3ED_0 <krzysztofas at protonmail>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=openoffice-extension-languagetool
pkgver=5.2.2
pkgrel=1
_dl_id=19024
pkgdesc="An Open Source style and grammar checker (more than 30 languages)"
arch=('any')
url="https://languagetool.org"
license=('LGPL')
groups=('openoffice-extensions')
depends=('openoffice' 'java-runtime>=8')
optdepends=('jre8-openjdk: java 8 or greater is required')
source=("LanguageTool-${pkgver}.oxt::https://extensions.openoffice.org/en/download/${_dl_id}")
noextract=("LanguageTool-${pkgver}.oxt")
sha512sums=('05e562df4883f937f0a3e0d875fd17bd895dc5ab9f7fe7fb4bdccc36d811ce6afa88e64923dc19297c0a5ac7d0155d2579ddd4d1c34d2f0cca7147e46e7b7970')

package() {
  _DESTDIR="${pkgdir}/opt/openoffice4/share/extensions/${_pkgname}/"
  install -dm755 "${_DESTDIR}"
  bsdtar -xf LanguageTool-${pkgver}.oxt -C "${_DESTDIR}"
  chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
