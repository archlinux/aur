# Contributer: abcfy2 <abcfy2@163.com>
pkgname='deepin-wine-helper-full'
pkgver=5.1.23
pkgrel=1
pkgdesc="Deepin Wine helper"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('Proprietary')
provides=("deepin-wine-helper=$pkgver")
conflicts=("deepin-wine-helper")
makedepends=('tar' 'p7zip')
source=(
    "http://community-store.deepin.com/appstore/apricot/pool/appstore/c/com.jiakaobaodian.deepin/com.jiakaobaodian.deepin_8.2.5deepin1_i386.deb"
)
sha256sums=('3f4463343287336dfe1c20a6ad2bb664098b85b86a58da31dfb5aa2f64d6c189')

package() {
	cd ${srcdir}
	tar xpvf data.tar.xz --xattrs-include='*' --numeric-owner
	install -d ${pkgdir}/opt/deepinwine/tools
    7z x -o${pkgdir}/opt/deepinwine/tools opt/apps/com.jiakaobaodian.deepin/files/helper_archive.7z
	cd ${pkgdir}/opt/deepinwine/tools
	sed -i -e '/CallApp()/{n;n;d}' run_v3.sh
}
