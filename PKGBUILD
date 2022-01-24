# Maintainer : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgname=intel-oneapi-vtune
pkgver=2022.1.0
_debpkgrel=98
pkgrel=1
pkgdesc="Intel® VTune(TM) Profiler"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("custom")
source=("https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-vtune-${pkgver}-${_debpkgrel}_amd64.deb")
sha256sums=('4e91aa1e233ecf62208941e367386733715d63e269fcec789fb9cf7ceb51fafe')

build() {
	tar xvf data.tar.xz
}

package() {
	depends=('intel-oneapi-common-vars>=2022.0.0' 'intel-oneapi-common-licensing=2022.0.0')
	mv ${srcdir}/opt ${pkgdir}
	ln -sfT "$pkgver" ${pkgdir}/opt/intel/oneapi/vtune/latest

}
