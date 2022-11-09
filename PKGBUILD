pkgname=camunda-modeler
pkgver=5.5.0
pkgrel=1
pkgdesc="An integrated modeling solution for BPMN and DMN based on bpmn.io"
arch=('x86_64')
url="https://camunda.org/features/modeler/"
license=('MIT')
install=$pkgname.install

source=("https://camunda.org/release/$pkgname/$pkgver/$pkgname-$pkgver-linux-x64.tar.gz"
        'camunda-modeler.sh')
        
sha256sums=('ae4b9aa56d73733758ca46e6a0ef28079166f9b67ac3b829a63cf29d6b18b731'
            'ef8abcbb783d73a41dc956b400b0281325c3a2320f6aec71c50a8af25e23ac13')

depends=('libnotify')

package() {
    cd "$srcdir"
    install -dm 755 "$pkgdir/opt/$pkgname"
    cp -af "$pkgname-$pkgver-linux-x64/." "$pkgdir/opt/$pkgname"
    install -dm 755 "$pkgdir/usr/bin/"
    install -Dm 775 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

