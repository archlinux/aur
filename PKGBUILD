# Maintainer: Sohimaster
pkgname=traur-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='Trust scoring for AUR packages (prebuilt)'
arch=('x86_64')
url='https://github.com/Sohimaster/traur'
license=('MIT')
depends=('git' 'pacman' 'gcc-libs' 'glibc')
provides=('traur')
conflicts=('traur')
source=("$url/releases/download/v$pkgver/traur-$pkgver-x86_64.tar.gz")
sha256sums=('b692251916a777bae2645bbf79d989f062859ef695abc492779bf55b1f01c44d')

package() {
    install -Dm0755 traur "$pkgdir/usr/bin/traur"
    install -Dm0755 traur-hook "$pkgdir/usr/bin/traur-hook"
    install -Dm0644 traur.hook "$pkgdir/usr/share/libalpm/hooks/traur.hook"
    install -Dm0644 patterns.toml "$pkgdir/usr/share/traur/patterns.toml"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
