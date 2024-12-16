# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname='smriti'
pkgname='smriti-bin'
pkgver=1.0.0
pkgrel=3
pkgdesc='Keep track of the commands your memory missed'
arch=('x86_64')
url="https://github.com/aspasht/$_pkgname"
license=('MIT')
source=("$_pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/cli-$CARCH-unknown-linux-gnu.tar.xz")
sha256sums=('SKIP')
conflicts=("$_pkgname")
provides=("$_pkgname")
depends=('sqlite')

prepare() {
    mv "cli-$CARCH-unknown-linux-gnu" "$_pkgname-$pkgver"
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm0755 "$_pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$_pkgname"
}
