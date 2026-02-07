pkgname=traur-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Trust scoring for AUR packages (prebuilt)'
arch=('x86_64')
url='https://github.com/Sohimaster/traur'
license=('MIT')
depends=('git' 'pacman')
provides=('traur')
conflicts=('traur')
source=("$url/releases/download/v$pkgver/traur-$pkgver-x86_64.tar.gz")
sha256sums=('f11feca5292e0b5ef103dde376d3e1e5d1c917a545d2b0f4b7882d0d4ef24592')

package() {
    install -Dm755 traur "$pkgdir/usr/bin/traur"
    install -Dm755 traur-hook "$pkgdir/usr/bin/traur-hook"
    install -Dm644 traur.hook "$pkgdir/usr/share/libalpm/hooks/traur.hook"
    install -Dm644 patterns.toml "$pkgdir/usr/share/traur/patterns.toml"
}
