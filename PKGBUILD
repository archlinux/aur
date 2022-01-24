# Maintainer : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgname=intel-oneapi-dpcpp-ct
pkgver=2022.0.0
_debpkgrel=96
pkgrel=1
pkgdesc="Intel® DPC++ Compatibility Tool"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("custom")
source=("https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dpcpp-ct-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dpcpp-ct-eclipse-cfg-${pkgver}-${_debpkgrel}_all.deb")
sha256sums=('3574b3fca83124ce57a184f27699f03744ecde619d3ee91c29b6411a0a3b0e14'
            '289e12f6ed8df55a233ba681885f07900b7b08cf5255428fdd8dd764c694d69d')

noextract=(
	"intel-oneapi-dpcpp-ct-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"intel-oneapi-dpcpp-ct-eclipse-cfg-${pkgver}-${_debpkgrel}_all.deb"
)

build() {
	ar x intel-oneapi-dpcpp-ct-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

	ar x intel-oneapi-dpcpp-ct-eclipse-cfg-${pkgver}-${_debpkgrel}_all.deb
	tar xvf data.tar.xz
}

package() {
	depends=('intel-oneapi-common-vars>=2022.0.0' 'intel-oneapi-common-licensing=2022.0.0')
	mv ${srcdir}/opt ${pkgdir}
	ln -sfT "$pkgver" ${pkgdir}/opt/intel/oneapi/dpcpp-ct/latest
}
