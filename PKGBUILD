# Contributer: abcfy2 <abcfy2@163.com>
pkgname='deepin-wine-helper-full'
pkgver=5.1.19
pkgrel=1
pkgdesc="Deepin Wine helper"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('Proprietary')
provides=("deepin-wine-helper=$pkgver")
conflicts=("deepin-wine-helper")
makedepends=('tar' 'p7zip')
source=(
    "http://community-store.deepin.com/appstore/apricot/pool/appstore/c/com.tencent.meeting.deepin/com.tencent.meeting.deepin_2.8.7.400deepin2_i386.deb"
)
sha256sums=('a738cddcfdf54595145676c402733eb5e9df2bde733615aa811e765e4fcb2d45')

package() {
	cd ${srcdir}
	tar xpvf data.tar.xz --xattrs-include='*' --numeric-owner
	install -d ${pkgdir}/opt/deepinwine/tools
    7z x -o${pkgdir}/opt/deepinwine/tools opt/apps/com.tencent.meeting.deepin/files/helper_archive.7z
	cd ${pkgdir}/opt/deepinwine/tools
	sed -i -e '/CallApp()/{n;n;d}' run_v3.sh
}
