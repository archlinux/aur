pkgname=hyprshell-bin
# x-release-please-start-version
pkgver=4.8.2
# x-release-please-end
pkgrel=1
pkgdesc="A modern GTK4-based window switcher and application launcher for Hyprland"
arch=('x86_64' 'aarch64')
conflicts=('hyprshell')
provides=('hyprshell')
url="https://github.com/h3rmt/hyprshell/"
license=("MIT")
depends=('hyprland' 'gtk4' 'gcc' 'pixman' 'libadwaita')
source_x86_64=("https://github.com/H3rmt/hyprshell/releases/download/v$pkgver/hyprshell-x86_64.tar.zst")
source_aarch64=("https://github.com/H3rmt/hyprshell/releases/download/v$pkgver/hyprshell-aarch64.tar.zst")

package() {
    install -Dm755 hyprshell "$pkgdir/usr/bin/hyprshell"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/hyprshell/LICENSE"

    "$pkgdir/usr/bin/hyprshell" completions bash -p "$pkgdir/usr/share/bash-completion/completions"
    "$pkgdir/usr/bin/hyprshell" completions fish -p "$pkgdir/usr/share/fish/vendor_completions.d"
    "$pkgdir/usr/bin/hyprshell" completions zsh -p "$pkgdir/usr/share/zsh/site-functions"
}
sha256sums_x86_64=('820bc068666868bd72027420b32c7cf19d81704f9caac3522399d57bd6fab5e4')
sha256sums_aarch64=('f940893b8a074a138b2849864cce256c8276405915cc6d79e1a943e6f7d277ce')
