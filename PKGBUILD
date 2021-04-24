# Maintainer : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgname=intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic
pkgver=2021.2.0
_debpkgrel=610
pkgrel=1
pkgdesc="Intel® oneAPI DPC++/C++ Compiler & Intel® C++ Compiler Classic 2021.2.0 for Linux* for Intel(R) 64"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("custom")
source=(
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-common-${pkgver}-${pkgver}-${_debpkgrel}_all.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-runtime-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
)
noextract=(
	"${pkgname}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"${pkgname}-common-${pkgver}-${pkgver}-${_debpkgrel}_all.deb"
	"${pkgname}-runtime-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
)
sha256sums=('b6698762fdd2a40582234f8c72d92a31bb07d6d604bfbe4eb3296293df2785a6'
            '9c5f3f48b2fdb5c62bf93cb9f8c28f8267138ed84c48b0ff95d881204a9b8e33'
            'cd32dc63cbfc806f4a7b3bf90ab33ae5a39e2d3f65a114a4c2180dde21887a6a')

build() {
	ar x ${pkgname}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-common-${pkgver}-${pkgver}-${_debpkgrel}_all.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-runtime-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz
}

package() {
	depends=('intel-oneapi-compiler-dpcpp-cpp' 'intel-oneapi-compiler-shared' 'intel-oneapi-common-vars' 'intel-oneapi-common-licensing')
	mv ${srcdir}/opt ${pkgdir}
}
