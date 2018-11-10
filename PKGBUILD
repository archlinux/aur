# Contributor: graysky <graysky AT archlinux dot us>
pkgname=('linpack')
pkgver=2018.3.011
_math_kernel_lib=2018
_url=9752
pkgrel=1
arch=('x86_64')
license=('custom')
url="http://software.intel.com/en-us/articles/intel-math-kernel-library-linpack-download"
source=("http://registrationcenter-download.intel.com/akdlm/irc_nas/$_url/l_mklb_p_$pkgver.tgz"
'linpack.conf' 'linpack_runme_xeon64')
sha256sums=('eac1fc2784c3ac2f130dafaa8e590b48f7623c577b469bae8b53decd27652b53'
            'd7e31c8c7e2648c8fa3c4838d98dfc39b8fadf0f74bdaa4ca52cd38277ec8254'
            '369736f6074ab579a1df38ba09be4784547833be020f13d1b60374f64ca5d5f6')

package_linpack() {
	pkgdesc='Benchmark based on linear algebra excellent app for stress testing.'
	backup=(etc/linpack.conf)
	_base="$srcdir/l_mklb_p_$pkgver/benchmarks_$_math_kernel_lib"
	_test="$_base/linux/mkl/benchmarks/linpack"
	
	install -Dm755 linpack_runme_xeon64 "$pkgdir/usr/bin/linpack_runme_xeon64"
	install -Dm644 linpack.conf "$pkgdir/usr/share/$pkgname/linpack.conf"
	install -Dm644 "$_base/license.txt" "$pkgdir/usr/share/licenses/linpack/license.txt"
	install -Dm755 "$_test/xlinpack_xeon64" "$pkgdir/usr/bin/xlinpack_xeon64"
}
