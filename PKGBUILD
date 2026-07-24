#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=home-assistant-tui-bin
pkgver=20260724.0
pkgrel=1
pkgdesc="Terminal UI for Home Assistant (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/timmo001/home-assistant-tui"
license=('Apache-2.0')
depends=('glibc')
provides=('home-assistant-tui')
conflicts=('home-assistant-tui' 'home-assistant-tui-git')
options=('!strip' '!debug')
source=('home-assistant-tui.bash' 'home-assistant-tui.fish' '_home-assistant-tui' 'LICENSE')
source_x86_64=("home-assistant-tui-${pkgver}-linux-${CARCH}.tar.gz::$url/releases/download/${pkgver}/home-assistant-tui-${pkgver}-linux-${CARCH}.tar.gz")
source_aarch64=("home-assistant-tui-${pkgver}-linux-${CARCH}.tar.gz::$url/releases/download/${pkgver}/home-assistant-tui-${pkgver}-linux-${CARCH}.tar.gz")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=('91e01100d8e994179a3a7b2fef3e85b7c1b2739e484a8cfb655fd833b1ca0181')
sha256sums_aarch64=('e9e292a4145f54869aec982faee47cc27270473a55448ec4f79fdaae37693653')

package() {
  install -Dm755 home-assistant-tui "$pkgdir/usr/bin/home-assistant-tui"
  install -Dm644 home-assistant-tui.bash "$pkgdir/usr/share/bash-completion/completions/home-assistant-tui"
  install -Dm644 home-assistant-tui.fish "$pkgdir/usr/share/fish/vendor_completions.d/home-assistant-tui.fish"
  install -Dm644 _home-assistant-tui "$pkgdir/usr/share/zsh/site-functions/_home-assistant-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
