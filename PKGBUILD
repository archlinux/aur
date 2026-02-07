pkgname=traur-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='Heuristic security scanner for AUR packages (prebuilt)'
arch=('x86_64')
url='https://github.com/Sohimaster/traur'
license=('MIT')
depends=('git' 'pacman')
provides=('traur')
conflicts=('traur')
source=("$url/releases/download/v$pkgver/traur-$pkgver-x86_64.tar.gz")
sha256sums=('d39b79b487b6d30a384cbbeb543b450f415dc47125582c51c96f22772b482383')

package() {
    install -Dm755 traur "$pkgdir/usr/bin/traur"
    install -Dm755 traur-hook "$pkgdir/usr/bin/traur-hook"
    install -Dm644 traur.hook "$pkgdir/usr/share/libalpm/hooks/traur.hook"
    install -Dm644 patterns.toml "$pkgdir/usr/share/traur/patterns.toml"
}
