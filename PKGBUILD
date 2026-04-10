# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiorii-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Modern offline-first eBook library manager built with Tauri, React, and Rust"
arch=('x86_64')
url="https://github.com/vinayydv3695/Shiori"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'sqlite'
    'zstd'
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
source=("Shiori_${pkgver}_linux_amd64.tar.gz::https://github.com/vinayydv3695/Shiori/releases/download/v${pkgver}/Shiori_${pkgver}_linux_amd64.tar.gz")
sha256sums=('19482adc0445b9adef280d39a9fc5b6c65c527e11e48084bb7521757b39fe168')

package() {
    bsdtar -xpf "${srcdir}/Shiori_${pkgver}_linux_amd64.tar.gz" -C "${pkgdir}"

    chmod -R u=rwX,go=rX "${pkgdir}/usr"
    [[ -f "${pkgdir}/usr/bin/shiori" ]] && chmod 755 "${pkgdir}/usr/bin/shiori"
}
