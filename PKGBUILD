# Contributor: graysky <graysky AT archlinux dot us>
pkgname=('linpack')
pkgver=2022.0.2.84
_math_kernel_lib=2022.0.2
pkgrel=1
arch=('x86_64')
license=('custom')
url="http://software.intel.com/en-us/articles/intel-math-kernel-library-linpack-download"
source=("https://downloadmirror.intel.com/721397/l-onemklbench-p-${pkgver//./-}.tgz"
'linpack.conf' 'linpack_runme_xeon64')
sha1sums=('3c9f41fcd1454bfbb5525a1056b18edc7f58aae5'
          '96636f441f3ab48b2df5e24afd2775ff5f954446'
          '9529264752433c0fa5fe33c9712ffc3cf83acc2a')

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
