# Maintainer: Matej Lach <me@matej-lach.me>
# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=tailwindcss-bin
pkgver=4.3.4 # datasource=github-releases depName=tailwindlabs/tailwindcss
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
sha256sums_aarch64=('f6d7baae1d350ed3a2defe98d0b5cc58e37400c0173b2e38d42f690ccc4bbfe1')
sha256sums_x86_64=('149a8ece5b855587a9c10de6da9dcbcfad0e47c4ed5dca219f721b3eae39d817')

package() {

	install -d "${pkgdir}/usr/bin"

	install -Dm755 "tailwindcss-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tailwindcss"
	install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
