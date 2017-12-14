# Contributor: graysky <graysky AT archlinux dot us>
pkgname=('linpack')
pkgver=2018.0.006
_math_kernel_lib=2018
_url=9752
pkgrel=1
arch=('x86_64')
license=('custom')
url="http://software.intel.com/en-us/articles/intel-math-kernel-library-linpack-download"
source=("http://registrationcenter-download.intel.com/akdlm/irc_nas/$_url/l_mklb_p_$pkgver.tgz"
'linpack.conf' 'linpack_runme_xeon64')
sha256sums=('75eca690d91ef065748218f105c2c47b902f1e113b64a0c3f6a8075c80248b95'
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
