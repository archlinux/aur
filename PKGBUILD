# Maintainer: Yiğit Salar <yigitsalar137 (at) gmail (dot) com>
_pkgname=DumpToolbox
pkgname=dumptoolbox-bin
pkgdesc="A cross-platform .NET 8 and Avalonia desktop application for disc-image conversion, checksum-based recovery, and reconstruction from Redumper, DiscImageCreator, and PlayStation 3 IRD metadata"
pkgver=0.8.98
pkgrel=1

repo="wiggy2k/${_pkgname}"
url="https://github.com/${repo}"

license=('GPL-3.0-or-later')
arch=('x86_64')
options=('!strip' '!debug')

provides=('dumptoolbox')
conflicts=('dumptoolbox')

source=("${url}/releases/download/${pkgver}/Linux-x64-v${pkgver}.zip"
"https://raw.githubusercontent.com/${repo}/master/README.md"
"https://raw.githubusercontent.com/${repo}/master/LICENSE")

md5sums=('fa5d85434c6a8c8a73764bcdcfb9e015'
'SKIP'
'SKIP')

package() {
	# Install BinaryObjectScanner distribution
	install -Dm755 ${srcdir}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

	# Install Documentation
	install -Dm644 ${srcdir}/README.md ${pkgdir}/usr/local/share/doc/${_pkgname}/README.md

	# Install LICENSE
	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
