pkgname=hyprshell-bin
# x-release-please-start-version
pkgver=4.8.1
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
sha256sums_x86_64=('5c1fab0bf55b02627ddd0bdf8f941fdc340cb6e7397d5e7d6f8e94632812b103')
sha256sums_aarch64=('ebaa413f3d6d4ad659b9c13a55fdcadc412634b1d5e9c22d90e453d8a2d08d6a')
