# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >
# Contributor : Claire Farron <diesal3@googlemail.com>
# Major Contributor : loqs (PKGBUILD, apt_pkg.patch)
# Contributor: Pedro Gabriel <pedrogabriel@dcc.ufmg.br>

pkgname=mintlocale
pkgver=1.4.4
pkgrel=1
pkgdesc='Language and locale selection tool'
arch=('any')
url='https://github.com/linuxmint/mintlocale'
license=('GPL2')
depends=('python2-gobject' 'python-gobject' 'gksu' 'iso-flag-png' 'xapps')
source=("https://github.com/linuxmint/mintlocale/archive/${pkgver}.tar.gz")
sha256sums=('6c4988408b5b894ba0d07742e162da11bdd162ff0506a5363b35b67d2a838107')

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
