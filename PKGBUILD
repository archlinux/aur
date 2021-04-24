# Maintainer : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgname=intel-oneapi-compiler-shared
pkgver=2021.2.0
_debpkgrel=610
pkgrel=1
pkgdesc="Intel(R) Compiler Shared Files"
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
sha256sums=('a491103d6a6e954bb02cbbcd7a90f0e68f968fda9a807a45167864e1d90588aa'
            'c3f9221c674cfd40087382cb801e95587c2d6f551c1a0ded945a43ef27ebc4dd'
            '248c0d1736ba22647a3d194ba9f3ab56e9f5fb8aa6b6e4294744be552503371f')

build() {
	ar x ${pkgname}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-common-${pkgver}-${pkgver}-${_debpkgrel}_all.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-runtime-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz
}

package() {
	depends=('intel-oneapi-dpcpp-debugger' 'intel-oneapi-common-vars' 'intel-oneapi-common-licensing')
	mv ${srcdir}/opt ${pkgdir}
}
