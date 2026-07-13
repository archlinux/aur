# Maintainer: Yiğit Salar <yigitsalar137 (at) gmail (dot) com>
_pkgname=BinaryObjectScanner
__pkgname=ProtectionScan
pkgname=binaryobjectscanner-bin
pkgdesc="Protection, packer, and archive scanning library"
pkgver=3.8.0
pkgrel=1
repo="SabreTools/${_pkgname}"
url="https://github.com/${repo}"
license=('MIT')
arch=('x86_64')
options=('!strip' '!debug')
provides=('binaryobjectscanner')
conflicts=('binaryobjectscanner')
source=("${url}/releases/download/${pkgver}/${__pkgname}_${pkgver}_net10.0_linux-x64_release.zip"
"https://raw.githubusercontent.com/${repo}/master/README.md"
"https://raw.githubusercontent.com/${repo}/master/LICENSE")
md5sums=('71705573f61ac9bb31eb2bb91c86b7d5'
'SKIP'
'SKIP')

package() {
	# Install BinaryObjectScanner distribution
	install -Dm755 ${srcdir}/${__pkgname} ${pkgdir}/usr/bin/${__pkgname}

	# Install Documentation
	install -Dm644 ${srcdir}/README.md ${pkgdir}/usr/local/share/doc/${__pkgname}/README.md

	# Install LICENSE
	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${__pkgname}/LICENSE
}
