# Maintainer: AlphaJack <19962243+AlphaJack at users dot noreply dot github dot com>
pkgname=mercurio-bin
pkgver=0.1.1
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
b2sums_x86_64=('f8bddf1bafe558314877f0b16569632daf4e8956b455346746bfb33d761728c8ad88a9e64b4f37c0967c9f84df6f1519cd3e2bfc98ea0aa92aa4d5661e14058f')
b2sums_aarch64=('cac10ebb812ab49288925d2600199489e7f50d41214b50bf58bb841c798767c765758274d14b8c454edceefd3464e0dea52f978460944888209612ac2a9a35c0')
b2sums_armv7h=('e0801ec0bad0e8ec26165f74e7f955af49d5fc4c4d373c19f9226b9fda7361067b0c7ac6ee1a821a243cf4d7015afb18cd6f5b9deab7eef3f9e98e1400418f1e')

package() {
  local dir
  dir="$(dirname "$(find "$srcdir" -type f -name mercurio | head -n 1)")"
  install -Dm755 "$dir/mercurio" "$pkgdir/usr/bin/mercurio"
  install -Dm644 "$dir/mercurio.service" "$pkgdir/usr/lib/systemd/system/mercurio.service"
  install -Dm600 "$dir/mercurio.env" "$pkgdir/etc/mercurio/mercurio.env"
}
