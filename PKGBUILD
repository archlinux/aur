# Contributer: abcfy2 <abcfy2@163.com>
pkgname='deepin-wine5-helper'
pkgver=5.1.15
pkgrel=2
pkgdesc="Deepin Wine5 helper"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('Proprietary')
depends=('deepin-wine5-stable')
provides=("deepin-wine-helper=$pkgver")
conflicts=("deepin-wine-helper")
makedepends=('tar' 'p7zip')
source=(
    "https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.xmly.deepin/com.xmly.deepin_1.6.0deepin0_i386.deb"
)
sha256sums=('8fe8924602e80ee4b92c3a4e41c5d5f7c503d2345bb0592a23636f772616ebb3')

package() {
	cd ${srcdir}
	tar xpvf data.tar.xz --xattrs-include='*' --numeric-owner
	install -d ${pkgdir}/opt/deepinwine/tools
    7z x -o${pkgdir}/opt/deepinwine/tools opt/apps/com.xmly.deepin/files/helper_archive.7z
	cd ${pkgdir}/opt/deepinwine/tools
	sed -i -e '/CallApp()/{n;n;d}' run_v3.sh
}
