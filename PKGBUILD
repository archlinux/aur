# Contributor: 3ED_0 <krzysztofas at protonmail>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=openoffice-extension-languagetool
pkgver=5.2.3
pkgrel=1
_dl_id=19029
pkgdesc="An Open Source style and grammar checker (more than 30 languages)"
arch=('any')
url="https://languagetool.org"
license=('LGPL')
groups=('openoffice-extensions')
depends=('openoffice-bin' 'java-runtime>=8')
optdepends=('jre8-openjdk: java 8 or greater is required')
source=("LanguageTool-${pkgver}.oxt::https://extensions.openoffice.org/en/download/${_dl_id}")
noextract=("LanguageTool-${pkgver}.oxt")
sha512sums=('53a61bb6a8114a2c1ff15f20de80c77d57fddf0d9f898372f4ecca2bea5c3bb00274ab4bf166b24159b15db4eea172e4ef045b79c403f5a110fa0a1a4ea7c153')

package() {
  _DESTDIR="${pkgdir}/opt/openoffice4/share/extensions/${_pkgname}/"
  install -dm755 "${_DESTDIR}"
  bsdtar -xf LanguageTool-${pkgver}.oxt -C "${_DESTDIR}"
  chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
