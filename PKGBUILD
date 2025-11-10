pkgname=hyprshell-bin
# x-release-please-start-version
pkgver=4.8.0
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
sha256sums_x86_64=('e9f4121ee33c3aace5513d657db95a633a3aae7237aa24a1428af4c3a5d21b1a')
sha256sums_aarch64=('d624dd9abf6442bca24a606dc4ab5921224b9a30565c55662e88df82aceff200')
