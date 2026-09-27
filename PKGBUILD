pkgname=camunda-modeler
pkgver=5.51.1
pkgrel=1
pkgdesc="An integrated modeling solution for BPMN and DMN based on bpmn.io"
arch=('x86_64')
url="https://camunda.org/features/modeler/"
license=('MIT')
install=$pkgname.install

source=("https://github.com/camunda/camunda-modeler/releases/download/v$pkgver/$pkgname-$pkgver-linux-x64.tar.gz"
        'camunda-modeler.sh')

sha256sums=('273acb842eb342128d46031061ccabb7bbddaeded042d08283ff06a2a57585ca'
            'ef8abcbb783d73a41dc956b400b0281325c3a2320f6aec71c50a8af25e23ac13')

depends=('libnotify')

package() {
    cd "$srcdir"
    install -dm 755 "$pkgdir/opt/$pkgname"
    cp -af "$pkgname-$pkgver-linux-x64/." "$pkgdir/opt/$pkgname"
    install -dm 755 "$pkgdir/usr/bin/"
    install -Dm 775 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

