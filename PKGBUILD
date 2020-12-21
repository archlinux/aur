# Maintainer: Julien Virey <julien.virey@gmail.com>
pkgname=menu-qalc
pkgver=1.4.1
pkgrel=1
pkgdesc="A calculator for Rofi/dmenu(2) using libqalculate"
arch=('any')
url="https://github.com/barbuk/menu-qalc"
license=('MIT')
depends=('libqalculate' 'xclip')
conflicts=('menu-calc')
optdepends=('dmenu: required if rofi is not installed'
            'rofi: required if dmenu is not installed')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2388a6fe41a08662ccd4c4dba118126ab89ca35fd38fc4dbc445e94f727d7fb3')

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    install -D -m755 ./= "$pkgdir/usr/bin/="
    mkdir -p "$pkgdir/usr/share/man/man1"
    install -D -m644 ./=.1 "$pkgdir/usr/share/man/man1/=.1"
    install -D -m644 ./menu-calc.1 "$pkgdir/usr/share/man/man1/menu-calc.1"
}
