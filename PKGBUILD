# Maintainer: agony <27015 at riseup dot net>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: PandaDEV <contact@pandadev.net>
pkgname=wireguard-gui-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="A WireGuard client GUI for Linux built with Tauri"
arch=('x86_64' 'aarch64')
url="https://github.com/0xle0ne/wireguard-gui"
license=('Apache-2.0 OR MIT')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'libsoup3'
  'openresolv'
  'webkit2gtk-4.1'
  'wireguard-tools'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("LICENSE-MIT-$pkgver::https://raw.githubusercontent.com/0xle0ne/wireguard-gui/refs/tags/$pkgver-stable/LICENSE-MIT"
        "wireguard-gui.desktop")
source_x86_64=("$url/releases/download/$pkgver-stable/${pkgname%-bin}_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/$pkgver-stable/${pkgname%-bin}_${pkgver}_arm64.deb")
sha256sums=('e532a576385a259c2baac5188fcdd4026d004876ad55d3274f88c53fe942556a'
            'a649764a630f65bf44848f99913fa9210c9606086ad3cea7e45e885b73232926')
sha256sums_x86_64=('d933006b8353ef5e40745dcf2713ef0dae3e741e9c458044e584b1526d2cb871')
sha256sums_aarch64=('c0b611c3e6ad43629f434ed57523be32b386309d7e00874eac80532e08c58483')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir/"
  install -Dm644 wireguard-gui.desktop "$pkgdir/usr/share/applications/wireguard-gui.desktop"
  install -Dm644 "LICENSE-MIT-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
