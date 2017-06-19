# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor : Claire Farron <diesal3@googlemail.com>
# Major Contributor : loqs (PKGBUILD, apt_pkg.patch)
# Contributor: Pedro Gabriel <pedrogabriel@dcc.ufmg.br>

pkgname=mintlocale
pkgver=1.4.3
pkgrel=1
pkgdesc="Language and locale selection tool"
arch=('any')
url="https://github.com/linuxmint/mintlocale"
license=('GPL2')
depends=('python2-gobject' 'python-gobject' 'gksu')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")

sha256sums=('136b2f985ffd5bca46ae47271365b266c0dabc58f055ba4f274b0147efbd74f4')

# Remove the im desktop file since input methods are handled differently on Arch
# You can still use "mintlocale im" command
prepare() {
	cd $pkgname-$pkgver
	cd usr/share/applications/
    rm mintlocale-im.desktop
}

package() {
	cd $pkgname-$pkgver
	cp -r usr $pkgdir
}
