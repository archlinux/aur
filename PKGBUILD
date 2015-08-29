
# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=ow-netware_ndk
pkgver=2008.02.27
pkgrel=1
pkgdesc="Netware C and NLM libraries for OpenWatcom"
arch=('any')
url="http://www.novell.com/coolsolutions/trench/411.html"
#http://www.novell.com/developer/ndk/netware_developer_suite_for_c.html
#ftp://sdk.provo.novell.com/ndk/ndkdoc/aux_files/nwsdkc/README.html
#https://www.novell.com/developer/ndk/nlm_and_netware_libraries_for_c_%28including_clib_and_xplat%29.html
license=('Proprietary: Novell Developer License Agreement')
groups=('watcom-netware')
depends=('openwatcom-v2')
makedepends=('openwatcom-v2')
options=(!strip !buildflags staticlibs emptydirs)
source=('ftp://sdk.provo.novell.com/ndk/clib/builds/netware_windows/novell-clib-devel-2008.02.27-1netware_windows.tar.gz')
md5sums=('f2f0f74f1618ed9fa1b149b476d1e42e')


build() {
	source /opt/watcom/owsetenv.sh
}


package() {
	cd "$srcdir/"novell-clib-devel-2008.02.27-1netware_windows/
	mkdir -p ${pkgdir}${WATCOM}/{nlm,novh,novi,lib386/netware}
	mkdir -p $pkgdir/usr/share/licenses/watcom/Netware/clib_nlm
	install -m644 imports/* ${pkgdir}${WATCOM}/novi/
	cp -ar include/* ${pkgdir}${WATCOM}/novh/
	cp -ar lib/nlm/* ${pkgdir}${WATCOM}/nlm/
	cp SDK_* $pkgdir/usr/share/licenses/watcom/Netware/clib_nlm/
}
