# Contributor: graysky <graysky AT archlinux dot us>
pkgname=('linpack')
pkgver=2019.6.005
_math_kernel_lib=2019
pkgrel=1
arch=('x86_64')
license=('custom')
url="http://software.intel.com/en-us/articles/intel-math-kernel-library-linpack-download"
source=("https://software.intel.com/sites/default/files/managed/cc/19/l_mklb_p_$pkgver.tgz"
'linpack.conf' 'linpack_runme_xeon64')
sha256sums=('9ebbd4f4898cdc5e8ee1425c5c955169cd3aa6f8742db37dd4d0d23fc7650a30'
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
