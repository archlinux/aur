#Contributor: Jussi Timperi <gmail.com: jussi.timperi>
#Maintainer:  Jesse Jaara   <gmail.com: jesse.jaara>

pkgname=mozvoikko
pkgver=2.1
pkgrel=1
pkgdesc="Finnish spell-checker extension for Firefox/thunderbird/seamonkey using Voikko"
arch=('any')
url="http://voikko.sourceforge.net"
license=('GPL2')
depends=('libvoikko')
_smversion="2.33.1"
optdepends=('firefox' 'thunderbird' "seamonkey=${_smversion}")
source=("http://www.puimula.org/voikko-sources/mozvoikko/${pkgname}-${pkgver}.tar.gz")
md5sums=('7bfd89e9389c8b74c91f894c74a92a85')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

   _UUID="{b676e3ff-cda7-4e0c-b2b8-74e4bb40a67a}"

  install -d -m755 "${pkgdir}/usr/lib/firefox/browser/extensions/${_UUID}"
  install -d -m755 "${pkgdir}/usr/lib/thunderbird/extensions/"
  install -d -m755 "${pkgdir}/usr/lib/seamonkey-${_smversion}/extensions/"

  cp -r * "${pkgdir}/usr/lib/firefox/browser/extensions/${_UUID}/"
  ln -s "/usr/lib/firefox/browser/extensions/${_UUID}" "${pkgdir}/usr/lib/thunderbird/extensions/${_UUID}"
  ln -s "/usr/lib/firefox/browser/extensions/${_UUID}" "${pkgdir}/usr/lib/seamonkey-${_smversion}/extensions/${_UUID}"
}

