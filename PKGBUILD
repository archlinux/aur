# Maintainer: Jothi Prasath <jothiprasath2@gmail.com>
pkgname=auto-epp
pkgver=1.2.1
pkgrel=2
pkgdesc="Automatic EPP Changer for amd-pstate-epp"
arch=('any')
url="https://github.com/jothi-prasath/auto-epp"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jothi-prasath/auto-epp/archive/v$pkgver.tar.gz")
sha256sums=('af2a00af2f070a8ad876883779a1db4de87c164a41218f369ba70bdeba9a65e5')

package() {
    cd "$srcdir/$pkgname-$pkgver/"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
    install -Dm644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
}
