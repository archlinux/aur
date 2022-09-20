# Maintainer: Huck Boles <huboles@protonmail.com>
pkgname=aursh
pkgver=0.2
pkgrel=1
pkgdesc="A simple AUR helper written in bash"
arch=('any')
url="https://github.com/huboles/aursh"
license=('GPL')
groups=('aursh')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/testing/$pkgname-$pkgver.tar.gz")
install=aursh.install
BUILDENV+=('!check')
package() {
	cd "$srcdir" || exit
    install -Dm644 aursh.conf "$pkgdir/etc/$pkgname/aursh.conf"
    install -Dm644 makepkg.conf "$pkgdir/etc/$pkgname/makepkg.conf"
    install -Dm644 pacman.conf "$pkgdir/etc/$pkgname/pacman.conf"
    install -Dm755 functions.sh "$pkgdir/usr/lib/$pkgname/functions.sh"
    install -Dm755 aur.sh "$pkgdir/usr/bin/aursh"
}
sha256sums=('f671611ba69d9e60dd729589b67a2342909a34af0abb64b42ce9f72801cbcf97')
