# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiorii-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Modern offline-first eBook library manager built with Tauri, React, and Rust (AppImage)"
arch=('x86_64')
url="https://github.com/vinayydv3695/Shiori"
license=('MIT')
depends=(
    'fuse2'
)
provides=(
    'shiorii'
    'shiori'
    'shiori-bin'
    'shiori-rin-bin'
    'shiori-ebook-bin'
)
conflicts=(
    'shiorii'
    'shiorii-git'
    'shiori'
    'shiori-git'
    'shiori-bin'
    'shiori-rin'
    'shiori-rin-bin'
    'shiori-ebook'
    'shiori-ebook-bin'
)
source=("Shiori_${pkgver}_linux_amd64.tar.gz::${url}/releases/download/v${pkgver}/Shiori_${pkgver}_linux_amd64.tar.gz")
sha256sums=('8ef98e0ec50b92cbb2f8b5bd05d44d99034b8a7ebb26f38887c5956d3584b098')

package() {
 bsdtar -xpf "${srcdir}/Shiori_${pkgver}_linux_amd64.tar.gz" -C "${pkgdir}"

 chmod -R u=rwX,go=rX "${pkgdir}/usr"
 [[ -f "${pkgdir}/usr/bin/shiori" ]] && chmod 755 "${pkgdir}/usr/bin/shiori"
 }
