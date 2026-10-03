# Maintainer: Aarav Maloo <aaravmaloo06@gmail.com>
pkgname=blob-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A minimal note manager that stays out of your way."
arch=('x86_64' 'aarch64')
url="https://github.com/aaravmaloo/blob"
license=('GPL-2.0-only')
provides=('blob')
conflicts=('blob')

source_x86_64=("https://github.com/aaravmaloo/blob/releases/download/v${pkgver}/blob-linux-amd64")
source_aarch64=("https://github.com/aaravmaloo/blob/releases/download/v${pkgver}/blob-linux-arm64")

sha256sums_x86_64=('ed820c1364441b71081ba7f04da30c27ee73287cabe803f251fa26912883130d')
sha256sums_aarch64=('819f15ee00608b6a02dfa3386436efd4ed8563320c539ce0b39d018e208af655')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "${srcdir}/blob-linux-amd64" "${pkgdir}/usr/bin/blob"
    else
        install -Dm755 "${srcdir}/blob-linux-arm64" "${pkgdir}/usr/bin/blob"
    fi
}
