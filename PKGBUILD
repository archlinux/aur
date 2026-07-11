# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=google-calendar-tui-bin
_pkgname=google-calendar-tui
pkgver=0.1.6
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
sha256sums_x86_64=('c27be00e95912c741e4d44449ef67b41acb9e7dacc9d1a5b750a17a8ab1a625c')
sha256sums_aarch64=('ca518790990d20ce5af046ef6264c698440bb2476458c0bcfd54b33f9c1835c8')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/"                    "google-calendar-tui"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/"    "README.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
