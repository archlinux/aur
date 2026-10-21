# Maintainer: AlphaJack <19962243+AlphaJack at users dot noreply dot github dot com>
pkgname=mercurio-bin
pkgver=0.2.0
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
b2sums_x86_64=('69718bc8652ab93123178aee72534708ed41c77c331ff35cb66d662bf31918ce30781136464a18c8c3dc795193e603e907220d9c4b1f9262973f2d8158969030')
b2sums_aarch64=('0499a2833df14f90b664180b315a4505b7b7fba6bb4bcdb4220304936880f8ee0b24948d24c31ea19fdd19154f5fc54a1b65068fa03182d50a075222199bcf3d')
b2sums_armv7h=('b72bf6bbde47a41f0dfa850a7ef111343f7c094916cdd86370ce4fca4a1bf941f8e7b6296e1d57ffdf662ababb14eb89ad200b53b1525660ae4fd78891b88fde')

package() {
  local dir
  dir="$(dirname "$(find "$srcdir" -type f -name mercurio | head -n 1)")"
  install -Dm755 "$dir/mercurio" "$pkgdir/usr/bin/mercurio"
  install -Dm644 "$dir/mercurio.service" "$pkgdir/usr/lib/systemd/system/mercurio.service"
  install -Dm600 "$dir/mercurio.env" "$pkgdir/etc/mercurio/mercurio.env"
}
