# Contributer: abcfy2 <abcfy2@163.com>
pkgname='deepin-wine-helper-full'
pkgver=5.1.16
pkgrel=1
pkgdesc="Deepin Wine helper"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('Proprietary')
provides=("deepin-wine-helper=$pkgver")
conflicts=("deepin-wine-helper")
makedepends=('tar' 'p7zip')
source=(
    "https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.youku.deepin/com.youku.deepin_8.0.7.11061deepin2_i386.deb"
)
sha256sums=('09fae5688383d9706001c72c04f09667215263446ab3f9ee15ddd80de517cb9e')

package() {
	cd ${srcdir}
	tar xpvf data.tar.xz --xattrs-include='*' --numeric-owner
	install -d ${pkgdir}/opt/deepinwine/tools
    7z x -o${pkgdir}/opt/deepinwine/tools opt/apps/com.youku.deepin/files/helper_archive.7z
	cd ${pkgdir}/opt/deepinwine/tools
	sed -i -e '/CallApp()/{n;n;d}' run_v3.sh
}
