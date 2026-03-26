# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiori-rin-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="Modern offline-first eBook library manager built with Tauri, React, and Rust (binary)"
arch=('x86_64')
url="https://github.com/vinayydv3695/Shiori"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libayatana-appindicator'
    'librsvg'
    'sqlite'
)
provides=('shiori-rin')
conflicts=(
    'shiori-rin'
    'shiori-rin'
    'shiori-rin-bin'
)
source=("Shiori_0.2.7_linux_amd64.tar.gz::${url}/releases/download/v${pkgver}/Shiori_0.2.7_linux_amd64.tar.gz")
sha256sums=('7ed29bc348300d8ea8e9fd43001e1e1964b8b746eaaa26959e13b92ff5eb54ec')

package() {
    # Extract release payload
    bsdtar -xpf "Shiori_${pkgver}_linux_amd64.tar.gz" -C "${pkgdir}"

    # Fix permissions
    chmod -R u+rwX,go+rX,go-w "${pkgdir}"
}
