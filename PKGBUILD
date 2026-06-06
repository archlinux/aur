# Maintainer: Aarav Maloo <aaravmaloo06@gmail.com>
pkgname=blob-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="A minimal note manager that stays out of your way."
arch=('x86_64' 'aarch64')
url="https://github.com/aaravmaloo/blob"
license=('GPL-2.0-only')
provides=('blob')
conflicts=('blob')

source_x86_64=("https://github.com/aaravmaloo/blob/releases/download/v${pkgver}/blob-linux-amd64")
source_aarch64=("https://github.com/aaravmaloo/blob/releases/download/v${pkgver}/blob-linux-arm64")

sha256sums_x86_64=('2914d057216ba0886e343177f3c2f2503ee995f7e8b2e5bde9f696f9aaa6b453')
sha256sums_aarch64=('e021213eac1fb457256d5d2d49f5a3343e6da9561e40fde8a769fccc8565a059')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "${srcdir}/blob-linux-amd64" "${pkgdir}/usr/bin/blob"
    else
        install -Dm755 "${srcdir}/blob-linux-arm64" "${pkgdir}/usr/bin/blob"
    fi
}
