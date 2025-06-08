# Maintainer: Savely Krasovsky <savely at krasovs dot ky>
pkgname=waybar-updates
pkgver=0.6.0
pkgrel=1
pkgdesc="Tiny Waybar module to check Arch Linux updates from official repositories and AUR"
arch=('any')
url="https://github.com/savely-krasovsky/waybar-updates"
license=("MIT")
depends=('bash' 'coreutils' 'pacman-contrib' 'gettext' 'curl' 'jq' 'libnotify')
provides=('waybar-updates')
source=("$pkgname-$pkgver.tar.gz::https://github.com/savely-krasovsky/waybar-updates/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('08c6916b5cf857107aeb2e7c583caae7e402942860fc49e10b0a23b6606a91a8')

build() {
    cd "$pkgname-$pkgver"
    make all
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX=/usr MANDIR=/usr/share/man install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
