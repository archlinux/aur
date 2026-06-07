# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=google-calendar-tui-bin
_pkgname=google-calendar-tui
pkgver=0.1.1
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
sha256sums_x86_64=('b52003e7e3a52c17c0cf3b04735f37fc3cc6859e5f016452719fa7bee84527af')
sha256sums_aarch64=('8a9649bf7fa29f3bba5111d3f564a9d10edaf2495090b66179379dad8cdcd5fe')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/"                    "google-calendar-tui"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/"    "README.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
