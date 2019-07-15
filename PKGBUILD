pkgname=camunda-modeler
pkgver=3.1.2
pkgrel=1
pkgdesc="An integrated modeling solution for BPMN and DMN based on bpmn.io"
arch=('x86_64')
url="https://camunda.org/features/modeler/"
license=('MIT')
install=$pkgname.install

source=("https://camunda.org/release/$pkgname/$pkgver/$pkgname-$pkgver-linux-x64.tar.gz"
        'camunda-modeler.sh')
        
sha256sums=('b19d6cf98e4d2aad6394be580d6eaaa5e678dc83b1ddc5fe56eaf87353888b3e'
            '5f2f52b71d0f2e98a3e9d6bc0169cc0bdfd88eb4dd40e6837a54e0cc9275dce7')

depends=('libnotify' 'gconf')

package() {
    cd "$srcdir"
    install -dm 755 "$pkgdir/opt/$pkgname"
    cp -af "$pkgname-$pkgver-linux-x64/." "$pkgdir/opt/$pkgname"
    install -dm 755 "$pkgdir/usr/bin/"
    install -Dm 775 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

