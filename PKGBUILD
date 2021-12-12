# Contributor: graysky <graysky AT archlinux dot us>
pkgname=('linpack')
pkgver=2021.2.0_109
_math_kernel_lib=2021.2.0
pkgrel=1
arch=('x86_64')
license=('custom')
url="http://software.intel.com/en-us/articles/intel-math-kernel-library-linpack-download"
source=("https://www.intel.com/content/dam/develop/external/us/en/documents/l_onemklbench_p_$pkgver.tgz"
'linpack.conf' 'linpack_runme_xeon64')
b2sums=('31642cc4fcf478cb8bed8f21b7e099f6d228c11de728c07bc3c19c545c2ba115213430e7a298167c60fc8e58f615cec319137d1bae9d489862ec0f95aedea932'
        'cb9e676aab60304f56c1ab099a0a46e0bb2af9beee93b95adbf2661c475c8e5a1ee35c6726f646b98c5cdacbdb1870488526bc0f19de59699c6a550bb2de06b6'
        '1ab0b9fde310496400bfa924c2e1a9206f341102117a64b3b086732394cbc33498708322ffbdf45b117898ed35a34b5107127cfedd9eec0eeb1a3f84d7aeaf63')

package_linpack() {
	pkgdesc='Benchmark based on linear algebra excellent app for stress testing.'
	backup=(etc/linpack.conf)
	_base="$srcdir/benchmarks_$_math_kernel_lib"
	_test="$_base/linux/mkl/benchmarks/linpack"
	
	install -Dm755 linpack_runme_xeon64 "$pkgdir/usr/bin/linpack_runme_xeon64"
	install -Dm644 linpack.conf "$pkgdir/usr/share/$pkgname/linpack.conf"
	install -Dm644 "$_base/license.txt" "$pkgdir/usr/share/licenses/linpack/license.txt"
	install -Dm755 "$_test/xlinpack_xeon64" "$pkgdir/usr/bin/xlinpack_xeon64"
}
