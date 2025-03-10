# Maintainer: redponike <proton (dot) me>
# Contributor: Nicholas Schlabach <Techcable at techcable dot net>

pkgname=zls-bin
pkgver="0.14.0"
pkgrel=1
pkgdesc="Zig Language Server, or zls, is a language server for Zig."
arch=('x86_64')
url="https://github.com/zigtools/zls"
license=('MIT')
depends=('zig-bin')
provides=('zls')
conflicts=('zls' 'zls-git' 'zls-13' 'zls-nightly-bin')
replaces=('zls' 'zls-git' 'zls-13' 'zls-nightly-bin')
source=(
    "$pkgname-$pkgver.tar.gz::https://builds.zigtools.org/zls-linux-${arch}-${pkgver}.tar.xz"
    "zls-LICENSE.txt::https://raw.githubusercontent.com/zigtools/zls/${pkgver}/LICENSE"
)
noextract=("zls-LICENSE.txt")
sha256sums=('661f8d402ba3dc9b04b6e9bc3026495be7b838d2f18d148db2bd98bd699c1360'
            'e0ef11f84a052c6a36c838a920dd0d852222b78e34c95bfc45ac7867de1a13ee')

package() {
    install -Dm755 "${srcdir}/zls" "${pkgdir}/usr/bin/zls"
    install -Dm644 "${srcdir}/zls-LICENSE.txt" "${pkgdir}/usr/share/licenses/zls-bin/LICENSE"
}
