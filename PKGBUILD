# Maintainer: Jonathan Sumner Evans <sumner.evans98@gmail.com>
pkgname=menu-calc
pkgver=1.3.0
pkgrel=1
pkgdesc="A calculator for Rofi/dmenu(2)"
arch=('any')
url="https://github.com/sumnerevans/menu-calc"
license=('MIT')
depends=('bc' 'xclip')
optdepends=('dmenu: required if rofi is not installed'
            'rofi: required if dmenu is not installed')
source=("https://github.com/sumnerevans/menu-calc/archive/v$pkgver.tar.gz")
sha256sums=('8486961fbbfe596ed7d92aaa5f908d7e11e1cc1c7753d5eef7fb8fdef78b2bad')

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    install -D -m755 ./= "$pkgdir/usr/bin/="
    mkdir -p "$pkgdir/usr/share/man/man1"
    install -D -m644 ./=.1 "$pkgdir/usr/share/man/man1/=.1"
    install -D -m644 ./menu-calc.1 "$pkgdir/usr/share/man/man1/menu-calc.1"
}
