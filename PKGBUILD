# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiorii-bin
pkgver=1.0.5
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
sha256sums=('a30fd2d96dff892340a0b2f7410a970d485158ec2ba0c9b756ee87059fef8ae7')

package() {
    bsdtar -xpf "${srcdir}/Shiori_${pkgver}_linux_amd64.tar.gz" -C "${pkgdir}"

    chmod -R u=rwX,go=rX "${pkgdir}/usr"
    [[ -f "${pkgdir}/usr/bin/shiori" ]] && chmod 755 "${pkgdir}/usr/bin/shiori"
}
