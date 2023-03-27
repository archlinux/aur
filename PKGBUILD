# Maintainer: acuteenvy
pkgname=shstatus
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple statusline generator for i3bar and swaybar"
arch=('any')
url="https://github.com/acuteenvy/$pkgname"
backup=('etc/shstatus/config.sh')
license=('MIT')
depends=('bash' 'coreutils' 'procps-ng')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('ad1c2adbd57f48f2176424f52e9f4f099f3de5e886c806ecc88895571030e8991236f591ead31d6384242173e59dfb1320cfcc0fa4bf6bf6725160ca27409271')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
