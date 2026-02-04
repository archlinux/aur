# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>

pkgname=lidm-bin
pkgver=2.0.0
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
            'a8b339da2555de2d65ecc3d641589ef9c3f9e311bfd8fa1f5679a343e21aa29c')
sha256sums_x86_64=('7ddf3ec19932405b60db1b9147097fd2d9109206eaedd3560f8bc112347900bf')
sha256sums_i686=('643e9695fb3c86832be8c2472bd142a500adcbc3219ab1f4127fe86b8a12889a')
sha256sums_aarch64=('c9408e1e76b3129be265af5ca2e425f69e186b741069c18c8b472a550552efcc')
sha256sums_armv7h=('61dce61fb9e8ebbcbd6098070ddab33d5eeb6d87e2f71de5aad10e23540a5507')
sha256sums_riscv64=('4069e2882c9dca778bbb414b66504d0f4d7fbf9a02779bbd047fa93e1c206cd6')

package() {
    cd "$srcdir"

    install -Dm755 "lidm-${pkgver}-$CARCH" "${pkgdir}/usr/bin/lidm"
    install -Dm644 "lidm-default-theme-${pkgver}.ini" "${pkgdir}/etc/lidm.ini"
    install -Dm644 "lidm-${pkgver}.1" "${pkgdir}/usr/share/man/man1/lidm.1"
    install -Dm644 "lidm-config-${pkgver}.5" "${pkgdir}/usr/share/man/man5/lidm-config.5"
}
