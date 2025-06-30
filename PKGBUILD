# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pyrefly-bin
pkgver=0.21.0
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

sha256sums_aarch64=('d4f8486eeece31abd2d930e2c9f48b500e0bf0c41009fb81789e5be97b27961a')
sha256sums_armv7h=('d98919c0612a5bbee07278dc85d7766b4d218ee7472a37b2f6ba6b03fdb894b9')
sha256sums_x86_64=('960bfd6538628d1246713b7fe1ce525be62f543ac8406b6bde9af2bfe1c52189')

package() {

	cd "${srcdir}/extension"

	install -Dm755 "bin/pyrefly" "${pkgdir}/usr/bin/pyrefly"
	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
