# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm-bin
pkgver=1.2.3
pkgrel=3
depends=('libpam.so')
pkgdesc="A fully colorful customizable TUI display manager made in C. (release binary)"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'riscv64')
url="https://github.com/javalsai/lidm"
license=('GPL')
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
sha256sums=('ffaa5fe2cf5011bf53c90f81bfec8585158d35f72c0666db0bd4d3866ae041ca'
            '7f2fb91f55088be1a9b1c93ecf5d6c1e437f369b56df2eacc9d10b00c93c39f8'
            '0aa5755bdcc60ea80cd9ee0f89233ffaf22c6cee9db9da277274a62c6ed477d9')
sha256sums_x86_64=('a533b5aee3ffe04268f8d3ff8d7eb87f09d31fbe25e1b8b1ed29c42ef465bd4b')
sha256sums_i686=('75018578e68bffda9807de8a65e16eaed8a16c6cf2417a0b58c5d5bcfa603e45')
sha256sums_aarch64=('1b81a1537a1e31ca1902cbc3b60add4ac712aa64fd4d266685f53372cc365882')
sha256sums_armv7h=('e86f59509fe2366d6312b9bc9e8d89c14e9c049fd713a04c41dab49a848b1ada')
sha256sums_riscv64=('3f0eb0315c523d367bac332641e5cd3c86cfd9aa4e7c14b2efc036937b97a598')

package() {
    cd "$srcdir"

    install -Dm755 "lidm-${pkgver}-$CARCH" "${pkgdir}/usr/bin/lidm"
    install -Dm644 "lidm-default-theme-${pkgver}.ini" "${pkgdir}/etc/lidm.ini"
    install -Dm644 "lidm-${pkgver}.1" "${pkgdir}/usr/share/man/man1/lidm.1"
    install -Dm644 "lidm-config-${pkgver}.5" "${pkgdir}/usr/share/man/man5/lidm-config.5"
}
