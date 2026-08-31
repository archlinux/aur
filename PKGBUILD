# Maintainer: Ryan Gaudon <aur@gaudon.ca>
pkgname=cursebreaker-bin
pkgver=4.9.0
pkgrel=1
pkgdesc="A CLI tool for CurseForge/WowInterface addon management (Pre-compiled Linux binary)"
arch=('x86_64')
url="https://github.com/AcidWeb/CurseBreaker"
license=('GPL3')
depends=('glibc' 'zlib' 'gcc-libs')
provides=('cursebreaker')
conflicts=('cursebreaker' 'cursebreaker-git')
source=("${url}/releases/download/v${pkgver}/CurseBreaker-linux.gz"
        "LICENSE-${pkgver}::${url}/raw/master/LICENSE.txt")
sha256sums=('1c1e408edc5d63de18fce4e510174c63b2b191fb7334cba180fc2ec5cfd0f79a'
            'c53a65c2fd561c87eaabf1072ef5dcab8653042bc15308465f52413585eb6271')

package() {
    install -Dm755 "${srcdir}/CurseBreaker-linux" "${pkgdir}/usr/bin/cursebreaker"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
