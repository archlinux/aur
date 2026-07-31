# Maintainer: Aarav Maloo <aaravmaloo06@gmail.com>
pkgname=cmdutils-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="A fast, zero-bloat CLI utility toolbox, written in Rust."
arch=('x86_64' 'aarch64')
url="https://github.com/aaravmaloo/cmdutils"
license=('MIT')
provides=('cmdutils')
conflicts=('cmdutils')

source_x86_64=("https://github.com/aaravmaloo/cmdutils/releases/download/v${pkgver}/cmdutils-v${pkgver}-linux_x64.tar.gz")
source_aarch64=("https://github.com/aaravmaloo/cmdutils/releases/download/v${pkgver}/cmdutils-v${pkgver}-linux_arm64.tar.gz")

sha256sums_x86_64=('1f5396bcf1de878e59fcb178cc7055b4ec2abf0229fd747514e8c0213481e6dd')
sha256sums_aarch64=('0c80217447d6c43fbd3b7def84cdfdd2202dc56ef9fe9b9a1b8409c317a20aaa')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "${srcdir}/cmdutils-v${pkgver}-linux_x64/cmdutils" "${pkgdir}/usr/bin/cmdutils"
    else
        install -Dm755 "${srcdir}/cmdutils-v${pkgver}-linux_arm64/cmdutils" "${pkgdir}/usr/bin/cmdutils"
    fi
}
