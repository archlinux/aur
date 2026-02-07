pkgname=traur-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Pre-install trust scoring for AUR packages (prebuilt)'
arch=('x86_64')
url='https://github.com/Sohimaster/traur'
license=('MIT')
depends=('git' 'pacman')
provides=('traur')
conflicts=('traur')
source=("$url/releases/download/v$pkgver/traur-$pkgver-x86_64.tar.gz")
sha256sums=('c77633726157a74ffd1fe017954863f3b63c7d96e14961b8e7e20312f829a5d3')

package() {
    install -Dm755 traur "$pkgdir/usr/bin/traur"
    install -Dm755 traur-hook "$pkgdir/usr/bin/traur-hook"
    install -Dm644 traur.hook "$pkgdir/usr/share/libalpm/hooks/traur.hook"
    install -Dm644 patterns.toml "$pkgdir/usr/share/traur/patterns.toml"
}
