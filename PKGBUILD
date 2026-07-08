# Maintainer: Yiğit Salar <yigitsalar137 (at) gmail (dot) com>
_pkgname=BinaryObjectScanner
__pkgname=ProtectionScan
pkgname=binaryobjectscanner-bin
pkgdesc="Protection, packer, and archive scanning library"
pkgver=3.7.1
pkgrel=1
repository="SabreTools/${_pkgname}"
url="https://github.com/${repository}"
license=('MIT')
arch=('x86_64')
options=('!strip' '!debug')
provides=('binaryobjectscanner')
conflicts=('binaryobjectscanner')
source=("${url}/releases/download/${pkgver}/${__pkgname}_${pkgver}_net10.0_linux-x64_release.zip"
"https://raw.githubusercontent.com/${repository}/master/README.md"
"https://raw.githubusercontent.com/${repository}/master/LICENSE")
sha256sums=('96ef35b920ac0d050571306d995f14873c817a3d6d6f397842e446fe5d9393aa'
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
