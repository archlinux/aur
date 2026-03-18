# Maintainer: Adria <adria@lightpanda.io>
pkgname=lightpanda-nightly-bin
pkgver=20260318.bd2406f8
pkgrel=1
pkgdesc="The headless browser designed for AI and data scripting (Nightly Build)"
arch=('x86_64' 'aarch64')
url="https://github.com/lightpanda-io/browser"
license=('AGPL-3.0')
provides=('lightpanda')
conflicts=('lightpanda')

source_x86_64=("${pkgname}-x86_64::https://github.com/lightpanda-io/browser/releases/download/nightly/lightpanda-x86_64-linux")
source_aarch64=("${pkgname}-aarch64::https://github.com/lightpanda-io/browser/releases/download/nightly/lightpanda-aarch64-linux")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

pkgver() {
    local _bin="${srcdir}/${pkgname}-${CARCH}"
    chmod +x "$_bin"
    echo "$(date +%Y%m%d).$($_bin version 2>&1)"
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${CARCH}" "${pkgdir}/usr/bin/lightpanda"
}
