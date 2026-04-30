# Maintainer: Nihal Kumar <2tv8xupqg at mozmail dot com>
pkgname=nu_plugin_desktop_notifications
pkgver=0.112.2
pkgrel=1
pkgdesc="A nushell plugin to send desktop notifications using notify-rust"
arch=('x86_64' 'aarch64')
url="https://github.com/fmotalleb/nu_plugin_desktop_notifications"
license=('MIT')
depends=('libnotify' 'dbus')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fmotalleb/nu_plugin_desktop_notifications/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --manifest-path Cargo.toml
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/nu_plugin_desktop_notifications "$pkgdir/usr/bin/nu_plugin_desktop_notifications"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}