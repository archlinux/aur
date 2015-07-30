# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: foxbunny <bg.branko@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=adobe-icc
pkgver=CS4
pkgrel=3
pkgdesc='Adobe ICC profiles'
arch=('any')
url='http://www.adobe.com/support/downloads/iccprofiles/iccprofiles_mac.html'
license=('custom')
makedepends=('unzip')
source=('http://download.adobe.com/pub/adobe/iccprofiles/mac/AdobeICCProfilesCS4Mac_end-user.zip'
        'LICENSE')
sha1sums=('395c0ebe306066660f510df43d830bd7ff64f223'
          '0745e9f0aacbd46c664fe59c5e4ffacc76cd84d9')

package() {
	cd "${srcdir}"
	install -d "${pkgdir}"/usr/share/{color/icc,doc/adobe-icc,licenses/adobe-icc}
	install -m644 */*/*.icc "${pkgdir}"/usr/share/color/icc
	install -m644 */*.pdf "${pkgdir}"/usr/share/doc/adobe-icc
	install -m644 LICENSE "${pkgdir}"/usr/share/licenses/adobe-icc
}
