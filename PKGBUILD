# Maintainer: Dunky <braxtinmoss13@gmail.com>

pkgname=rofi-radio
pkgver=r10.36ee02f
pkgrel=1
pkgdesc="A simple internet radio script for wofi/rofi"
arch=('any')
url="https://github.com/prbhtkumr/rofi-radio"
license=('MIT')
depends=('wofi' 'mpv' 'libnotify')
makedepends=('git')
provides=('rofi-radio')
conflicts=('rofi-radio')
source=("git+https://github.com/prbhtkumr/rofi-radio.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm755 rofi-radio "$pkgdir/usr/bin/rofi-radio"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
