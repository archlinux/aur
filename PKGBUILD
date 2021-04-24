# Maintainer : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgname=intel-oneapi-compiler-fortran
pkgver=2021.2.0
_debpkgrel=610
pkgrel=1
pkgdesc="Intel® Fortran Compiler (Beta) & Intel® Fortran Compiler Classic 2021.2.0 for Linux* for Intel(R) 64"
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
sha256sums=('9fd08227fda9d5f46e0629c6cbd228793acf758d42bbb92556c546d7e873fc38'
            '230f0acbbf2280c12e7104d3fdac420bd98d8adbc7991b2841f5a0e810bdd157'
            '4da4af4e33c451eaf95441eec852d8352aaf7d4d6c7c8662de7da75e592e85ed')

build() {
	ar x ${pkgname}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-common-${pkgver}-${pkgver}-${_debpkgrel}_all.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-runtime-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz
}

package() {
	depends=('intel-oneapi-compiler-shared' 'intel-oneapi-common-vars' 'intel-oneapi-common-licensing')
	mv ${srcdir}/opt ${pkgdir}
}
