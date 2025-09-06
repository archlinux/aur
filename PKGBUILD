# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pyrefly-bin
pkgver=0.31.1 # datasource=github-tags depName=facebook/pyrefly
pkgrel=1
pkgdesc='A faster Python type checker written in Rust'
arch=('aarch64' 'armv7h' 'x86_64')
url='https://pyrefly.org/'
license=('MIT')

_baseurl="https://meta.gallery.vsassets.io/_apis/public/gallery/publisher/\
meta/extension/pyrefly/${pkgver}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"

source_aarch64=("pyrefly-aarch64-${pkgver}.vsix::${_baseurl}?targetPlatform=linux-arm64")
source_armv7h=("pyrefly-armv7h-${pkgver}.vsix::${_baseurl}?targetPlatform=linux-armhf")
source_x86_64=("pyrefly-x86_64-${pkgver}.vsix::${_baseurl}?targetPlatform=linux-x64")

sha256sums_aarch64=('c4958689c04b1cc56cc75492e1e88808e7a1d31f92a57318431f04a4cba8daf0')
sha256sums_armv7h=('c0dbe92a3ddc371e7111b73f0f536238f01cc603a4256e9b2f65309bee5a7cb2')
sha256sums_x86_64=('19dade508b0f72bea44f31292085e300a9e272f3c38b9227bf95537bfe9f7e15')

package() {

	cd "${srcdir}/extension"

	install -Dm755 "bin/pyrefly" "${pkgdir}/usr/bin/pyrefly"
	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
