# Maintainer: Savely Krasovsky <savely at krasovs dot ky>
pkgname=waybar-updates
pkgver=0.3.0
pkgrel=1
pkgdesc="Tiny Waybar module to check Arch Linux updates from official repositories and AUR"
arch=('any')
url="https://github.com/L11R/waybar-updates"
license=("MIT")
depends=('bash' 'coreutils' 'pacman-contrib' 'gettext' 'curl' 'jq' 'libnotify')
provides=('waybar-updates')
source=("$pkgname-$pkgver.tar.gz::https://github.com/L11R/waybar-updates/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('05e05b69bb16a210e3c17cd912f0bf78c0f38a118b76769cb3520ea603a07e8e')

build() {
    cd "$pkgname-$pkgver"
    make all
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX=/usr MANDIR=/usr/share/man install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
