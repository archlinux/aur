# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>

pkgname=lidm-bin
pkgver=2.0.2
pkgrel=1
depends=('libpam.so' 'lidm-service')
pkgdesc="A fully colorful customizable TUI display manager made in C. (release binary)"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'riscv64')
url="https://github.com/javalsai/lidm"
license=('GPL-3.0-only')
provides=('lidm')
conflicts=('lidm')
source=(
    "lidm-default-theme-${pkgver}.ini::https://raw.githubusercontent.com/javalsai/lidm/v$pkgver/themes/default.ini"
    "lidm-${pkgver}.1::https://raw.githubusercontent.com/javalsai/lidm/v$pkgver/assets/man/lidm.1"
    "lidm-config-${pkgver}.5::https://raw.githubusercontent.com/javalsai/lidm/v$pkgver/assets/man/lidm-config.5"
)
source_x86_64=("lidm-${pkgver}-x86_64::$url/releases/download/v$pkgver/lidm-amd64")
source_i686=("lidm-${pkgver}-i686::$url/releases/download/v$pkgver/lidm-i386")
source_aarch64=("lidm-${pkgver}-aarch64::$url/releases/download/v$pkgver/lidm-aarch64")
source_armv7h=("lidm-${pkgver}-armv7h::$url/releases/download/v$pkgver/lidm-armv7")
source_riscv64=("lidm-${pkgver}-riscv64::$url/releases/download/v$pkgver/lidm-riscv64")
sha256sums=('9f5c68524498b05b686918d6bf60c18bee4ffbf66be2a4b979b863ad83731729'
            '7f2fb91f55088be1a9b1c93ecf5d6c1e437f369b56df2eacc9d10b00c93c39f8'
            '27b88e994f111c8aed95ea6a8fbf04c3ddcf67b8e3d054ad31a136a9c9e16c08')
sha256sums_x86_64=('84d7d3243a58151a954e70ff944eab84b65ccafefa52ce6300be27a9153abc36')
sha256sums_i686=('4ec4ebde1e3b419fd43ae5e3e461e11d64a773b6123505c4d0ec729ab75a28cf')
sha256sums_aarch64=('f251203921b7616049b364ef78b3697b289f1211396aaf1e8c00e127d0b34fb9')
sha256sums_armv7h=('7c94314c296330c7183a9af07db61c91f1bce2553d20687b726ece27043e7866')
sha256sums_riscv64=('8ef24b8c8748128d7c80c7bccdd495497d17e46b646c7d1ae7e859864ce36d4c')

package() {
    cd "$srcdir"

    install -Dm755 "lidm-${pkgver}-$CARCH" "${pkgdir}/usr/bin/lidm"
    install -Dm644 "lidm-default-theme-${pkgver}.ini" "${pkgdir}/etc/lidm.ini"
    install -Dm644 "lidm-${pkgver}.1" "${pkgdir}/usr/share/man/man1/lidm.1"
    install -Dm644 "lidm-config-${pkgver}.5" "${pkgdir}/usr/share/man/man5/lidm-config.5"
}
