# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=google-calendar-tui-bin
_pkgname=google-calendar-tui
pkgver=0.1.0
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
sha256sums_x86_64=('047c36beebd2d19fab3bdff8b3b2279795643f4b8823761f8b35a23f4ead58c1')
sha256sums_aarch64=('f2a8e87849a39bc9220a39dc6e03eaf05391d86d1d1659d524a92c43d5775825')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/"                    "google-calendar-tui"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/"    "README.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
