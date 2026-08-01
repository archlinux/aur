# Maintainer: Aarav Maloo <aaravmaloo06@gmail.com>
pkgname=blob-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A minimal note manager that stays out of your way."
arch=('x86_64' 'aarch64')
url="https://github.com/aaravmaloo/blob"
license=('GPL-2.0-only')
provides=('blob')
conflicts=('blob')

source_x86_64=("https://github.com/aaravmaloo/blob/releases/download/v${pkgver}/blob-linux-amd64")
source_aarch64=("https://github.com/aaravmaloo/blob/releases/download/v${pkgver}/blob-linux-arm64")

sha256sums_x86_64=('e6acc86b1dc404934a32b287168d8be6dc839b53da069e2b9797e539a54f6521')
sha256sums_aarch64=('14bf2168f2eb161417bceeae7546634b00e166c96d76d3eb67cb0927d5c751fd')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "${srcdir}/blob-linux-amd64" "${pkgdir}/usr/bin/blob"
    else
        install -Dm755 "${srcdir}/blob-linux-arm64" "${pkgdir}/usr/bin/blob"
    fi
}
