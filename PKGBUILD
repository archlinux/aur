# Maintainer: Bradford Smith <aur@bradfords.me>

pkgname=informant
pkgver=0.1.0
pkgrel=2
pkgdesc="An Arch Linux News reader and pacman hook"
arch=('any')
url="https://github.com/bradford-smith94/$pkgname"
license=('MIT')
install=informant.install
depends=('python' 'python-docopt' 'python-dateutil' 'python-feedparser' 'python-html2text')
source=("https://github.com/bradford-smith94/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b0181dbb940a27328524f0ee0c3aede9eef26c77d25d92868cbde4b6db071fea')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 $pkgname -t $pkgdir/usr/bin/
    install -Dm 0644 $pkgname.hook -t $pkgdir/usr/share/libalpm/hooks/
    install -Dm 0644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
    install -Dm 0644 man/$pkgname.1 -t $pkgdir/usr/share/man/man1/
}
