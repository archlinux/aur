# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pyrefly-bin
pkgver=0.27.2 # datasource=github-tags depName=facebook/pyrefly
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

sha256sums_aarch64=('5804c37f71e8419f2ab52ce9ea509b931d7b790e02a22021bb112733bddc2070')
sha256sums_armv7h=('5d80cb60c0866a1934d61d2d76b92570cb85ce9f9ed316fcbdc0af5adc86c911')
sha256sums_x86_64=('a4f71be5f988c9de528f459dd38eeda791a41eb43f79b374f0ce4f7c94eae185')

package() {

	cd "${srcdir}/extension"

	install -Dm755 "bin/pyrefly" "${pkgdir}/usr/bin/pyrefly"
	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
