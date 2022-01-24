# Maintainer : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgname=intel-oneapi-dpl
pkgver=2021.6.0
_debpkgrel=501
pkgrel=1
pkgdesc="Intel® oneAPI DPC++ Library 2021.6.0 for Linux*"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("custom")
source=("https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-libdpstd-devel-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb")
sha256sums=('f949db5bbc9d96b6f9e062691f931b19e5d07f208e590bc48954404d6a3fb9eb')

build() {
	tar xvf data.tar.xz
}

package() {
	depends=('intel-oneapi-common-vars>=2022.0.0' 'intel-oneapi-common-licensing=2022.0.0')
	mv ${srcdir}/opt ${pkgdir}
	ln -sfT "$pkgver" ${pkgdir}/opt/intel/oneapi/dpl/latest

	mkdir -p ${pkgdir}/usr/lib/cmake
	ln -sfT "/opt/intel/oneapi/dpl/latest/lib/cmake/oneDPL" ${pkgdir}/usr/lib/cmake/oneDPL
}
