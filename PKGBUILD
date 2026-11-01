# Maintainer: hosua <hosua.o@gmail.com>
pkgname=steam-redeemer-bin
_pkgname=steam-redeemer
pkgver=2026.08.17.2
pkgrel=1
pkgdesc="Bulk-redeem Humble Bundle Steam keys with ownership detection (prebuilt binary)"
arch=('x86_64')
url="https://github.com/castanley/humble-steam-redeem"
license=('LicenseRef-unknown')
depends=('glibc' 'zlib')
provides=("$_pkgname")
conflicts=("$_pkgname")
# The binary is a PyInstaller onefile: its bundled archive is appended to the ELF,
# and strip would cut it off.
options=('!strip' '!debug')
source=("steam-redeemer.sh")
source_x86_64=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/steam-redeemer-linux")
sha256sums=('24c8a01d390472b959dcac62693ab98738ef44a01112ce2a384b0327e5d85dd0')
sha256sums_x86_64=('481ac74a14b684606a9ef9545b541d715f086c2be21000f35072ddb5f68bc604')

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver" "$pkgdir/opt/$_pkgname/$_pkgname"
    install -Dm755 "$srcdir/steam-redeemer.sh" "$pkgdir/usr/bin/$_pkgname"
}
