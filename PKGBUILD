# Maintainer: Matej Lach <me@matej-lach.me>
# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=tailwindcss-bin
pkgver=4.1.12 # datasource=github-releases depName=tailwindlabs/tailwindcss
pkgrel=1
pkgdesc='Standalone Tailwind CLI without dependency on Node.js'
arch=('aarch64' 'x86_64')
url='https://tailwindcss.com'
license=('MIT')
depends=('glibc')
options=('!strip')
conflicts=('tailwindcss')
provides=('tailwindcss')

_repourl="https://github.com/tailwindlabs/tailwindcss"
_baseurl="${_repourl}/releases/download/v${pkgver}"

source_aarch64=("tailwindcss-${pkgver}-aarch64::${_baseurl}/tailwindcss-linux-arm64")
source_x86_64=("tailwindcss-${pkgver}-x86_64::${_baseurl}/tailwindcss-linux-x64")

source=("LICENSE-${pkgver}::${_repourl}/raw/refs/tags/v${pkgver}/LICENSE")

sha256sums=('60e0b68c0f35c078eef3a5d29419d0b03ff84ec1df9c3f9d6e39a519a5ae7985')
sha256sums_aarch64=('181332974fff1b3423ad75d6a2f1d09adf1ca63eb1324db0afbc4c30ff1ad086')
sha256sums_x86_64=('5eeee66ea237eae9a160fa3314fd0cf76ab993551a99fafb16fa1db6c6b90289')

package() {

	install -d "${pkgdir}/usr/bin"

	install -Dm755 "tailwindcss-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tailwindcss"
	install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
