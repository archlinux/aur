# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pyrefly-bin
pkgver=0.31.0 # datasource=github-tags depName=facebook/pyrefly
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

sha256sums_aarch64=('5389281a355b1168178f87b535631fa910dd5c01460d8e4c6edd3dfb35a8026b')
sha256sums_armv7h=('53ef37639ca491abdee3c079d79e3a51ae1ae6301c36d82d3cc3934992dff49b')
sha256sums_x86_64=('f85c19b1850c09196079549f23cc12e5ad65662f4becc12048e03062032bfaef')

package() {

	cd "${srcdir}/extension"

	install -Dm755 "bin/pyrefly" "${pkgdir}/usr/bin/pyrefly"
	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
