# Maintainer: Helltar <iam@helltar.com>

pkgname=gcencryptor
pkgver=1.5.3
pkgrel=1
pkgdesc="GUI application for gocryptfs"
arch=('x86_64')
url="https://github.com/Helltar/gcencryptor"
license=('GPL3')
depends=('qt5pas' 'gocryptfs')

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.svg")

sha256sums=('c33a06c6f02a53f73725192ac490236b6bab0061b1f9aa81de5fcdb7afa9a8bc'
            '1b7d3ccbc119ea43dc7b252114e1bf97cd0a212f6fb02231a0e7b93811461a43'
            '64b0bce6f048d72e91621edb5403c7d132956b85b97790b55dd9ded646fc7467')

package() {

    mkdir -p "$pkgdir"/usr/lib
    cp -r $pkgname "$pkgdir"/usr/lib/$pkgname

    mkdir -p "$pkgdir"/usr/bin
    ln -s /usr/lib/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname

    install -Dm644 $pkgname.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
