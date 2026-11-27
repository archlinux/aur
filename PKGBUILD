# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
pkgname=bitrise-bin
pkgver=3.5.0
pkgrel=1
pkgdesc="The workflow runner that powers Bitrise builds.Run your automations on your Mac or Linux machine."
arch=(
	'aarch64'
	'x86_64'
)
url="https://www.bitrise.io/cli"
_ghurl="https://github.com/bitrise-io/bitrise"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
options=(
	'!strip'
)
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/bitrise-io/bitrise/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-Linux-arm64")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-Linux-x86_64")
sha256sums=('a0379118157469b6a466bf070c8986ffbca0874d10bb4950e0c6018544914414')
sha256sums_aarch64=('a9865355a9115db71c2a5ffbfd4a8624d03fac885f8f94fada980b7178d8bef4')
sha256sums_x86_64=('3d03bbf5e35510c812c0e70a069a1b9f9c88eec4c0c36dc30444bacdf81ee3ee')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}