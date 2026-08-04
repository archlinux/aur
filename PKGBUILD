pkgname=camunda-modeler
pkgver=5.49.0
pkgrel=1
pkgdesc="An integrated modeling solution for BPMN and DMN based on bpmn.io"
arch=('x86_64')
url="https://camunda.org/features/modeler/"
license=('MIT')
install=$pkgname.install

source=("https://camunda.org/release/$pkgname/$pkgver/$pkgname-$pkgver-linux-x64.tar.gz"
        'camunda-modeler.sh')
        
sha256sums=('1c76b0fa4e50c1c8ebc69b18caa4e0e849109460e0d7a81b72e465f72df56aa5'
            'ef8abcbb783d73a41dc956b400b0281325c3a2320f6aec71c50a8af25e23ac13')

depends=('libnotify')

package() {
    cd "$srcdir"
    install -dm 755 "$pkgdir/opt/$pkgname"
    cp -af "$pkgname-$pkgver-linux-x64/." "$pkgdir/opt/$pkgname"
    install -dm 755 "$pkgdir/usr/bin/"
    install -Dm 775 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

