# Contributor: graysky <graysky AT archlinux dot us>
pkgname=('linpack')
pkgver=2020.2.001
_math_kernel_lib=2020
pkgrel=1
arch=('x86_64')
license=('custom')
url="http://software.intel.com/en-us/articles/intel-math-kernel-library-linpack-download"
source=("https://software.intel.com/content/dam/develop/external/us/en/documents/l_mklb_p_$pkgver.tgz"
'linpack.conf' 'linpack_runme_xeon64')
b2sums=('b26e7220bf1c02b3f58ba9f67733cded00f98cb084bc56d783654de17e6b50bbe71369be6566110606303b8d0f59ff7f2940f8e8d35e4eb0aa9aff00901496b4'
        'cb9e676aab60304f56c1ab099a0a46e0bb2af9beee93b95adbf2661c475c8e5a1ee35c6726f646b98c5cdacbdb1870488526bc0f19de59699c6a550bb2de06b6'
        '1ab0b9fde310496400bfa924c2e1a9206f341102117a64b3b086732394cbc33498708322ffbdf45b117898ed35a34b5107127cfedd9eec0eeb1a3f84d7aeaf63')

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
