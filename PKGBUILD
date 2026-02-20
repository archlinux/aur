# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>

pkgname=lidm-bin
pkgver=2.0.1
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
sha256sums_x86_64=('12b061e2782547bc80f85b8010d12dc93c523c985c6bb94bbe5708770958115c')
sha256sums_i686=('502a6c62397945f9f6d8126b1a397a6704da962ded140316af5ce303240c8857')
sha256sums_aarch64=('e1e968cd6159d8d4845f81ea24825cfc39b0a3c49b1cc9c31d0fb143939da77a')
sha256sums_armv7h=('06593b59addb012107da208e5909fff07973204ae7605190e48857e2c9779a14')
sha256sums_riscv64=('8e07b5f4a39c7321cbb14c37ba773129190f3152b9ab0a21024ac87a3f02ce89')

package() {
    cd "$srcdir"

    install -Dm755 "lidm-${pkgver}-$CARCH" "${pkgdir}/usr/bin/lidm"
    install -Dm644 "lidm-default-theme-${pkgver}.ini" "${pkgdir}/etc/lidm.ini"
    install -Dm644 "lidm-${pkgver}.1" "${pkgdir}/usr/share/man/man1/lidm.1"
    install -Dm644 "lidm-config-${pkgver}.5" "${pkgdir}/usr/share/man/man5/lidm-config.5"
}
