# Maintainer: Savely Krasovsky <savely at krasovs dot ky>
pkgname=waybar-updates
pkgver=0.3.1
pkgrel=2
pkgdesc="Tiny Waybar module to check Arch Linux updates from official repositories and AUR"
arch=('any')
url="https://github.com/savely-krasovsky/waybar-updates"
license=("MIT")
depends=('bash' 'coreutils' 'pacman-contrib' 'gettext' 'curl' 'jq' 'libnotify')
provides=('waybar-updates')
source=("$pkgname-$pkgver.tar.gz::https://github.com/savely-krasovsky/waybar-updates/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bfa128fad7f100d46a6591e263b27065f85498b01a3f07e01822e5f23ea13eef')

build() {
    cd "$pkgname-$pkgver"
    make all
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX=/usr MANDIR=/usr/share/man install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
