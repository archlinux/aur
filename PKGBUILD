# Maintainer : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgname=intel-oneapi-libdpstd
pkgver=2021.2.0
_debpkgrel=245
pkgrel=1
pkgdesc="Intel® oneAPI DPC++ Library 2021.2.0 for Linux*"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("custom")
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-devel-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb")
sha256sums=('2397888676ceca38f7ed7de0174c1de72463e3d7151f976cf61046a315a78427')

build() {
	tar xvf data.tar.xz
}

package() {
	depends=('intel-oneapi-common-vars' 'intel-oneapi-common-licensing')
	mv ${srcdir}/opt ${pkgdir}
	ln -sfT "$pkgver" ${pkgdir}/opt/intel/oneapi/dpl/latest

	mkdir -p ${pkgdir}/usr/lib/cmake
	ln -sfT "/opt/intel/oneapi/dpl/latest/lib/cmake/oneDPL" ${pkgdir}/usr/lib/cmake/oneDPL
}
