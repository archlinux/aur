# Maintainer: Savely Krasovsky <savely at krasovs dot ky>
pkgname=waybar-updates
pkgver=0.2.6
pkgrel=1
pkgdesc="Tiny Waybar module to check Arch Linux updates from official repositories and AUR"
arch=('any')
url="https://github.com/L11R/waybar-updates"
license=("MIT")
depends=('bash' 'coreutils' 'pacman-contrib' 'gettext' 'curl' 'jq' 'libnotify')
provides=('waybar-updates')
source=("$pkgname-$pkgver.tar.gz::https://github.com/L11R/waybar-updates/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9df6ec31786bc9263b26db43c4936a0014713beb6fd1ba03a1edd34b28ffb720')

build() {
    cd "$pkgname-$pkgver"
    make all
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX=/usr MANDIR=/usr/share/man install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
