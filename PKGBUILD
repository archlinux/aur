pkgname=camunda-modeler
pkgver=5.35.0
pkgrel=1
pkgdesc="An integrated modeling solution for BPMN and DMN based on bpmn.io"
arch=('x86_64')
url="https://camunda.org/features/modeler/"
license=('MIT')
install=$pkgname.install

source=("https://camunda.org/release/$pkgname/$pkgver/$pkgname-$pkgver-linux-x64.tar.gz"
        'camunda-modeler.sh')
        
sha256sums=('20c76b9e4a29f32cc7ad3bcd7414ba6d565d941b021cccc28d873405a5d1cab1'
            'ef8abcbb783d73a41dc956b400b0281325c3a2320f6aec71c50a8af25e23ac13')

depends=('libnotify')

package() {
    cd "$srcdir"
    install -dm 755 "$pkgdir/opt/$pkgname"
    cp -af "$pkgname-$pkgver-linux-x64/." "$pkgdir/opt/$pkgname"
    install -dm 755 "$pkgdir/usr/bin/"
    install -Dm 775 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

