#Maintainer: Daniel Lehmann <daniellehmann28@outlook.de>
pkgname=sliver-bin
pkgver=1.5.37
pkgrel=1
pkgdesc="Sliver is a an opensource C2 framework designed by bishop fox"
url="https://github.com/BishopFox/sliver"
arch=('x86_64')
depends=()
optdepends=()
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
install=
source_x86_64=("https://github.com/BishopFox/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-client_linux" "https://github.com/BishopFox/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-server_linux")
# source_x86_64=("https://github.com/BishopFox/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-client_linux" "https://github.com/BishopFox/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-client_linux.sig" "https://github.com/BishopFox/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-server_linux" "https://github.com/BishopFox/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-server_linux.sig")
# validgpgkeys=('0ED3900D296CFA0283A4E4667DF912404449039C')
sha256sums_x86_64=('5fffcdd337374e2843c7582b798b983785da5ab3afb6e30b78cef4620d248b09' '996e7473634a2b894f6e154073d780b12f9ef1b8f1471bb945c7c2cf1c56010a')
# sha256sums_x86_64=('5fffcdd337374e2843c7582b798b983785da5ab3afb6e30b78cef4620d248b09' 'afabb213499036eb1aa379aa91c62bedb75f085dd3962b90638a65bea1fc5d25' '996e7473634a2b894f6e154073d780b12f9ef1b8f1471bb945c7c2cf1c56010a' 'dcd82c989816c886bbe27741b2bece34a7bf4a1a9a34abfb9b34fe3cf9484201')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 "$srcdir/${pkgname%-bin}-server_linux" "$pkgdir/usr/bin/${pkgname%-bin}-server"
    install -m755 "$srcdir/${pkgname%-bin}-client_linux" "$pkgdir/usr/bin/${pkgname%-bin}-client"
}
