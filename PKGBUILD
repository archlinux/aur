# Maintainer: kloogans <https://github.com/kloogans>
pkgname=yappie
pkgver=r3.e490525
pkgrel=1
pkgdesc='Voice dictation for Wayland'
arch=('any')
url='https://github.com/kloogans/yappie-linux'
license=('MIT')
depends=('pipewire' 'curl' 'nmap' 'jq' 'ydotool' 'wl-clipboard' 'libnotify')
optdepends=('hyprland: smart terminal paste detection' 'sway: smart terminal paste detection')
makedepends=('git')
install=yappie.install
source=("$pkgname::git+https://github.com/kloogans/yappie-linux.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    install -Dm755 bin/yappie "$pkgdir/usr/bin/yappie"
    install -Dm644 config.example.toml "$pkgdir/usr/share/yappie/config.example.toml"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
