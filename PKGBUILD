# Maintainer: Matej Lach <me@matej-lach.me>
# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=tailwindcss-bin
pkgver=4.1.17 # datasource=github-releases depName=tailwindlabs/tailwindcss
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
sha256sums_aarch64=('264689984311cc2ca104a9d6a4d039b4267aecf4543dc9ea0bbc094eeb0ccc8d')
sha256sums_x86_64=('cc115d9b6c4ede4e423bfea6a3cfc3f03e6c1702b7d910369b9540e2b4cf3860')

package() {

	install -d "${pkgdir}/usr/bin"

	install -Dm755 "tailwindcss-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tailwindcss"
	install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
