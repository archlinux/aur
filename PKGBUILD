# Maintainer: Aarav Maloo <aaravmaloo06@gmail.com>
pkgname=blob-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A minimal note manager that stays out of your way."
arch=('x86_64' 'aarch64')
url="https://github.com/aaravmaloo/blob"
license=('GPL-2.0-only')
provides=('blob')
conflicts=('blob')

source_x86_64=("https://github.com/aaravmaloo/blob/releases/download/v${pkgver}/blob-linux-amd64")
source_aarch64=("https://github.com/aaravmaloo/blob/releases/download/v${pkgver}/blob-linux-arm64")

sha256sums_x86_64=('50ad4e552f8d16cc7ad25ff9d1b27eed0562cbf701ea6d7a986d9ba2caa6f667')
sha256sums_aarch64=('e3182e049fce4e2255066b928257d648dda2578a44009d3c0299334e2ff90049')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "${srcdir}/blob-linux-amd64" "${pkgdir}/usr/bin/blob"
    else
        install -Dm755 "${srcdir}/blob-linux-arm64" "${pkgdir}/usr/bin/blob"
    fi
}
