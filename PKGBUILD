# Maintainer: Jothi Prasath <jothiprasath2@gmail.com>
pkgname=auto-epp
pkgver=1.1.0
pkgrel=1
pkgdesc="Automatic EPP Changer for amd-pstate-epp"
arch=('any')
url="https://github.com/jothi-prasath/auto-epp"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jothi-prasath/auto-epp/archive/v$pkgver.tar.gz")
sha256sums=('45782ccc7033e0a590a8f2a06111382346e75442230576d3181c277db7d5fcb9')

package() {
    cd "$srcdir/$pkgname-$pkgver/"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
    install -Dm644 $pkgname.service -t "$pkgdir/etc/systemd/system"
}
