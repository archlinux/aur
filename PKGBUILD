# Maintainer: EmIsGreat <monsoon-package@gemderbent.dev>

pkgname="monsoon-emulator-bin"
pkgver="0.2.9"
pkgrel=1
pkgdesc="A work-in-progress NES emulator"
arch=('x86_64')
url="https://github.com/EmIsGreat/Monsoon-Emulator"
license=('Apache-2.0')

provides=('monsoon-emulator')
conflicts=('monsoon-emulator')
options=('!debug')

depends=(
    'glibc'
    'gcc-libs'
)

_cli_pkg_ver="0.2.9"

source=(
    "${pkgname%-emulator-bin}-cli-${_cli_pkg_ver}.tar.gz::$url/releases/download/v${_cli_pkg_ver}/monsoon-cli-$CARCH-unknown-linux-gnu.tar.gz"
    "${pkgname%-emulator-bin}-frontend-$pkgver.tar.gz::$url/releases/download/v$pkgver/monsoon-frontend-$CARCH-unknown-linux-gnu.tar.gz"
    "https://raw.githubusercontent.com/EmIsGreat/Monsoon-Emulator/v$pkgver/LICENSE"
    "monsoon.desktop"
)

b2sums=('9adbba5ccddb49861327693f6e5cdfcf8206fcbdbbf8541d82820c221dcd83d7ef5fa7bb23ea4e096cbb99034612ce15b8de7a19508228a41a9ca9cc3c9cf798'
        'b68e6c71d61490dafbabe885c5eba93d7ec4af9a365052c8c308707ae6d04cf91d5cc10411393c927382c843994b3e8be9c20c2e9f54482d72ee7a57fe5ff226'
        '40b4641424fe7d53369c27edd05f1dba3380b32917d0e2464862e2d1a44ea1768810e65eb392274205ac95b9d10f9867f63258aab28d0bf6ceb4bf98b880b991'
        'cd638963202d541d38a03b7008392b091f13910fb6e7b06f31ae1a090003f25046b0595cdfa5d03b527e62d037ad9e19a63b335aa931183d0466afef80e76da5')

package() {
    install -Dm755 "${pkgname%-emulator-bin}-cli-$CARCH-unknown-linux-gnu.x86_64" "$pkgdir/usr/bin/${pkgname%-emulator-bin}-cli"
    install -Dm755 "${pkgname%-emulator-bin}-frontend-$CARCH-unknown-linux-gnu.x86_64" "$pkgdir/usr/bin/${pkgname%-emulator-bin}-frontend"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$srcdir/monsoon.desktop" "$pkgdir/usr/share/applications/monsoon.desktop"
}
