# Maintainer: Sohimaster
pkgname=traur-bin
pkgver=0.2.2
pkgrel=1
pkgdesc='Trust scoring for AUR packages (prebuilt)'
arch=('x86_64')
url='https://github.com/Sohimaster/traur'
license=('MIT')
depends=('git' 'pacman' 'gcc-libs' 'glibc')
provides=('traur')
conflicts=('traur')
source=("$url/releases/download/v$pkgver/traur-$pkgver-x86_64.tar.gz")
sha256sums=('d5d76f4cb9925ea66a80064ac80aa61f12666b34316d377bcbdd9dc568fb4ff6')

package() {
    install -Dm0755 traur "$pkgdir/usr/bin/traur"
    install -Dm0755 traur-hook "$pkgdir/usr/bin/traur-hook"
    install -Dm0644 traur.hook "$pkgdir/usr/share/libalpm/hooks/traur.hook"
    install -Dm0644 patterns.toml "$pkgdir/usr/share/traur/patterns.toml"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
