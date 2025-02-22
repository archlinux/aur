# Maintainer: Matej Lach <me@matej-lach.me>
# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=tailwindcss-bin
pkgver=4.0.8
pkgrel=1
pkgdesc='Standalone Tailwind CLI without dependency on Node.js'
arch=("aarch64" "x86_64")
url='https://tailwindcss.com'
license=('MIT')
depends=("glibc")
options=(!strip)
conflicts=('tailwindcss')
provides=('tailwindcss')

source_aarch64=("tailwindcss-${pkgver}-aarch64::https://github.com/tailwindlabs/tailwindcss/releases/download/v${pkgver}/tailwindcss-linux-x64")
source_x86_64=("tailwindcss-${pkgver}-x86_64::https://github.com/tailwindlabs/tailwindcss/releases/download/v${pkgver}/tailwindcss-linux-x64")

sha256sums_aarch64=('ea623609623c128727ec6f5ea13a6193570bfad47eae7290dd54d749570104f9')
sha256sums_x86_64=('ea623609623c128727ec6f5ea13a6193570bfad47eae7290dd54d749570104f9')

package() {

    install -d "${pkgdir}/usr/bin"

    install -Dm755 "tailwindcss-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tailwindcss"
	install -Dm644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
