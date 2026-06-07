# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=google-calendar-tui-bin
_pkgname=google-calendar-tui
pkgver=0.1.4
pkgrel=1
pkgdesc="Read-only terminal agenda for Google Calendar via GNOME Online Accounts (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/akitaonrails/google-calendar-tui"
license=('MIT')
depends=('gcc-libs' 'dbus' 'gnome-online-accounts')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-debug")
options=('!strip' '!debug')

# Per-arch sources — pacman picks the matching one for the host arch.
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64.tar.gz")
sha256sums_x86_64=('2655d855337b8bf808e5a7e4ee6ecc441e94dbe3cf8a1321fa278a52117a9258')
sha256sums_aarch64=('1b51bbee6bfd7b960cbde6e3b6808ab2c3499e24b58c4dfa7009d3ed9e1e4191')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/"                    "google-calendar-tui"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/"    "README.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
