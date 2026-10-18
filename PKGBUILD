# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname=mercurio-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="Apprise-compatible Rust library, CLI and HTTP server to send notifications to 150+ services via a single URL."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/AlphaJack/mercurio"
license=('Apache-2.0')
provides=('mercurio')
conflicts=('mercurio')
options=('!strip' '!debug')
backup=('etc/mercurio/mercurio.env')
source_x86_64=("$url/releases/download/v$pkgver/mercurio-cli-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("$url/releases/download/v$pkgver/mercurio-cli-aarch64-unknown-linux-musl.tar.xz")
source_armv7h=("$url/releases/download/v$pkgver/mercurio-cli-armv7-unknown-linux-musleabihf.tar.xz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_armv7h=('SKIP')

package(){
 local dir
 dir="$(dirname "$(find "$srcdir" -type f -name mercurio | head -n 1)")"
 install -D -m 755 "$dir/mercurio" "$pkgdir/usr/bin/mercurio"
 install -D -m 644 "$dir/mercurio.service" "$pkgdir/usr/lib/systemd/system/mercurio.service"
 install -D -m 600 "$dir/mercurio.env" "$pkgdir/etc/mercurio/mercurio.env"
}
