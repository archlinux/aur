# Maintainer: Ryan Gaudon <aur@gaudon.ca>
pkgname=cursebreaker-bin
pkgver=4.8.4
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
sha256sums=('bff5e780882d8e4370f4ad7d22aa0ad0bb5663bc2aa0c08344284042aae390e0'
            'c53a65c2fd561c87eaabf1072ef5dcab8653042bc15308465f52413585eb6271')

package() {
    install -Dm755 "${srcdir}/CurseBreaker-linux" "${pkgdir}/usr/bin/cursebreaker"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
