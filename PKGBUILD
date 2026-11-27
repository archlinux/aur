# Maintainer: Ryan Gaudon <aur@gaudon.ca>
pkgname=cursebreaker-bin
pkgver=5.0.0
pkgrel=1
pkgdesc="A CLI tool for CurseForge/WowInterface addon management (Pre-compiled Linux binary)"
arch=('x86_64')
url="https://github.com/AcidWeb/CurseBreaker"
license=('GPL3')
depends=('glibc' 'zlib' 'gcc-libs')
provides=('cursebreaker')
conflicts=('cursebreaker' 'cursebreaker-git')
source=("${url}/releases/download/v${pkgver}/CurseBreaker-linux.gz"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE.txt")
sha256sums=('81c101593cc903b61f15eca481b792c527680e1bc6ee8a52b85ff436b833d337'
            'c53a65c2fd561c87eaabf1072ef5dcab8653042bc15308465f52413585eb6271')

package() {
    install -Dm755 "${srcdir}/CurseBreaker-linux" "${pkgdir}/usr/bin/cursebreaker"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
