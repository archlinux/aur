# Maintainer: agony <27015 at riseup dot net>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: PandaDEV <contact@pandadev.net>
pkgname=wireguard-gui-bin
pkgver=0.1.8
pkgrel=4
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
        "LICENSE-APACHE-$pkgver::https://raw.githubusercontent.com/0xle0ne/wireguard-gui/refs/tags/$pkgver-stable/LICENSE-APACHE"
        "wireguard-gui.desktop")
source_x86_64=("$url/releases/download/$pkgver-stable/${pkgname%-bin}_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/$pkgver-stable/${pkgname%-bin}_${pkgver}_arm64.deb")
sha256sums=('e532a576385a259c2baac5188fcdd4026d004876ad55d3274f88c53fe942556a'
            '702d5bcdbc2323cdd8d05cf3d494fcbc48b122a4caafe4b43d3a0921e9d04921'
            'a649764a630f65bf44848f99913fa9210c9606086ad3cea7e45e885b73232926')
sha256sums_x86_64=('d2497f671b9c86f530b8f11ae4ab436c46c6bfc04db199aa5a2af308e8a7aefc')
sha256sums_aarch64=('493c0e06036f2bf0067f28ae63929c37b30768ac68b48ccb157a43f9a7899b3f')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir/"
  install -Dm644 wireguard-gui.desktop "$pkgdir/usr/share/applications/wireguard-gui.desktop"
  install -Dm644 "LICENSE-MIT-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
