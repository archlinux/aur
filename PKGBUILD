# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >
# Contributor : Claire Farron <diesal3@googlemail.com>
# Major Contributor : loqs (PKGBUILD, apt_pkg.patch)
# Contributor: Pedro Gabriel <pedrogabriel@dcc.ufmg.br>

pkgname=mintlocale
pkgver=1.4.5
pkgrel=1
pkgdesc='Language and locale selection tool'
arch=('any')
url='https://github.com/linuxmint/mintlocale'
license=('GPL2')
depends=('python2-gobject' 'python-gobject' 'accountsservice' 'iso-flag-png' 'xapps')
source=("https://github.com/linuxmint/mintlocale/archive/${pkgver}.tar.gz")
sha256sums=('2823e63ee59a9fe760efc63182ab0fec945b5a3d815f35f6d0edecee6da7b59a')

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
