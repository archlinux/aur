pkgname=camunda-modeler
pkgver=4.9.0
pkgrel=1
pkgdesc="An integrated modeling solution for BPMN and DMN based on bpmn.io"
arch=('x86_64')
url="https://camunda.org/features/modeler/"
license=('MIT')
install=$pkgname.install

source=("https://camunda.org/release/$pkgname/$pkgver/$pkgname-$pkgver-linux-x64.tar.gz"
        'camunda-modeler.sh')
        
sha256sums=('52d81a830f3a1e7c423ba79bf45d9019aa2c55141f2801877fca9a083ac66f3e'
            '5f2f52b71d0f2e98a3e9d6bc0169cc0bdfd88eb4dd40e6837a54e0cc9275dce7')

depends=('libnotify')

package() {
    cd "$srcdir"
    install -dm 755 "$pkgdir/opt/$pkgname"
    cp -af "$pkgname-$pkgver-linux-x64/." "$pkgdir/opt/$pkgname"
    install -dm 755 "$pkgdir/usr/bin/"
    install -Dm 775 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

