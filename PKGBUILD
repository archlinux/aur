# Contributer: abcfy2 <abcfy2@163.com>
pkgname='deepin-wine5-helper'
pkgver=5.1.16
pkgrel=1
pkgdesc="Deepin Wine5 helper"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('Proprietary')
depends=('deepin-wine5-stable')
provides=("deepin-wine-helper=$pkgver")
conflicts=("deepin-wine-helper")
makedepends=('tar' 'p7zip')
source=(
    "https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.pscs6.deepin/com.pscs6.deepin_13.0deepin3_i386.deb"
)
sha256sums=('b8f57f343dc595d65d41d1a78992095553dd052e6937b041b78dc349d6a7e709')

package() {
	cd ${srcdir}
	tar xpvf data.tar.xz --xattrs-include='*' --numeric-owner
	install -d ${pkgdir}/opt/deepinwine/tools
    7z x -o${pkgdir}/opt/deepinwine/tools opt/apps/com.pscs6.deepin/files/helper_archive.7z
	cd ${pkgdir}/opt/deepinwine/tools
	sed -i -e '/CallApp()/{n;n;d}' run_v3.sh
}
