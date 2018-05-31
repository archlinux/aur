# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >
# Contributor : Claire Farron <diesal3@googlemail.com>
# Major Contributor : loqs (PKGBUILD, apt_pkg.patch)
# Contributor: Pedro Gabriel <pedrogabriel@dcc.ufmg.br>

pkgname=mintlocale
pkgver=1.4.7
pkgrel=1
pkgdesc='Language and locale selection tool'
arch=('any')
url='https://github.com/linuxmint/mintlocale'
license=('GPL2')
depends=('python-gobject' 'accountsservice' 'iso-flag-png' 'xapps')
source=("https://github.com/linuxmint/mintlocale/archive/${pkgver}.tar.gz")
sha256sums=('4465e0deb891aa712cb48e72cfb971994f2270525cea6d9c3c6ef39c97476d9e')

# Remove the im desktop file since input methods are handled differently on Arch
# You can still use "mintlocale im" command
prepare() {
	cd "${pkgname}-${pkgver}"
	rm -f 'usr/share/applications/mintlocale-im.desktop'
}

package() {
	cd "${pkgname}-${pkgver}"
	cp -R 'usr' "${pkgdir}"
}
