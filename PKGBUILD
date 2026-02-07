pkgname=traur-bin
pkgver=0.1.6
pkgrel=1
pkgdesc='Heuristic security scanner for AUR packages (prebuilt)'
arch=('x86_64')
url='https://github.com/Sohimaster/traur'
license=('MIT')
depends=('git' 'pacman')
provides=('traur')
conflicts=('traur')
source=("$url/releases/download/v$pkgver/traur-$pkgver-x86_64.tar.gz")
sha256sums=('42f451ab427f3c7f5a16935a5e7f5ba28b3a0e3ff1c720938b70203a6210ec62')

package() {
    install -Dm755 traur "$pkgdir/usr/bin/traur"
    install -Dm755 traur-hook "$pkgdir/usr/bin/traur-hook"
    install -Dm644 traur.hook "$pkgdir/usr/share/libalpm/hooks/traur.hook"
    install -Dm644 patterns.toml "$pkgdir/usr/share/traur/patterns.toml"
}
