# Maintainer: Jothi Prasath <jothiprasath2@gmail.com>
pkgname=auto-epp
pkgver=1.2.0
pkgrel=1
pkgdesc="Automatic EPP Changer for amd-pstate-epp"
arch=('any')
url="https://github.com/jothi-prasath/auto-epp"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jothi-prasath/auto-epp/archive/v$pkgver.tar.gz")
sha256sums=('e6b31f14e675416af093b6debf7563a3a26145ee1d0fc3621ecee91bd538ea9c')

package() {
    cd "$srcdir/$pkgname-$pkgver/"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
    install -Dm644 $pkgname.service -t "$pkgdir/etc/systemd/system"
}
