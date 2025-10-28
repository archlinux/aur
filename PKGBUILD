# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pyrefly-bin
pkgver=0.39.1 # datasource=github-tags depName=facebook/pyrefly
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

sha256sums_aarch64=('ff90967c9515641a3dd204465347648666cbb46b2776775ce8258c5ed8c33195')
sha256sums_armv7h=('42d4cad90a603d65594b7b971a87cb5a608f7e7aebed7dc849ec32233aa68985')
sha256sums_x86_64=('a81d50f6d32b47795d49ae3d49ca57960b9667504cba4853f2aef328a8455e82')

package() {

	cd "${srcdir}/extension"

	install -Dm755 "bin/pyrefly" "${pkgdir}/usr/bin/pyrefly"
	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
