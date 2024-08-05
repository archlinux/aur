# Maintainer: Savely Krasovsky <savely at krasovs dot ky>
pkgname=waybar-updates
pkgver=0.4.0
pkgrel=1
pkgdesc="Tiny Waybar module to check Arch Linux updates from official repositories and AUR"
arch=('any')
url="https://github.com/savely-krasovsky/waybar-updates"
license=("MIT")
depends=('bash' 'coreutils' 'pacman-contrib' 'gettext' 'curl' 'jq' 'libnotify')
provides=('waybar-updates')
source=("$pkgname-$pkgver.tar.gz::https://github.com/savely-krasovsky/waybar-updates/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a5775dca59750a21e003de10b7f893cda84f582561879af5eb8f653e258ede66')

build() {
    cd "$pkgname-$pkgver"
    make all
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX=/usr MANDIR=/usr/share/man install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
