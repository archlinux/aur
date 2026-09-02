# Maintainer: Abdullah Khabir <abdullahx1c@gmail.com>
pkgname=lemonbar-ng
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight status bar with Xft and Nerd Font support"
arch=('x86_64')
url="https://gitlab.com/Abdullah/lemonbar-ng"
license=('MIT')
depends=(
    'libxcb'
    'libx11'
    'libxft'
)
conflicts=('lemonbar' 'lemonbar-xft-git')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('91d3cd05ab9c0296ed5b2cc28b51253737f54f15e6a5b454e8551be6990f2e0a09a4db3c1b2fb32adddf64637794eb238b605e36705b97fdd863d14efccb55f1')

build() {
    cd "$pkgname-v$pkgver"
    make
}

package() {
    cd "$pkgname-v$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
