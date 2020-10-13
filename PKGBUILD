# Maintainer: Abigail G <dev@kb6.ee>

pkgname=gridtracker
pkgver=1.20.0927
pkgrel=1
pkgdesc="Companion program for WSJT-X for mapping contacts"
arch=('x86_64')
url="https://gridtracker.org/grid-tracker/"
license=('BSD')
depends=('nwjs-bin>=0.48.0')
replaces=('gridtracker-bin')
source=("https://gitlab.com/gridtracker.org/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('c1e61eb7114f3285e16d925a2eaeadff')

package() {
    cd "$srcdir/$pkgname-v$pkgver/"
    install -Dm 755 debian/gridtracker.sh $pkgdir/usr/bin/$pkgname
    install -Dm 644 debian/gridtracker.desktop $pkgdir/usr/share/applications/gridtracker.desktop
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    mkdir -p $pkgdir/usr/share/$pkgname
    cp -r package.nw/* $pkgdir/usr/share/$pkgname/
}
