# Maintainer: Helltar <iam@helltar.com>

pkgname=gcencryptor
pkgver=1.5.1
pkgrel=1
pkgdesc="GUI application for gocryptfs"
arch=('x86_64')
url="https://github.com/Helltar/gcencryptor"
license=('GPL3')
depends=('qt5pas' 'gocryptfs')

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.png")

sha256sums=('a7f970f491afdd53adb52e7ff94042c33c36c64ff525550aef64beadc57410e6'
            '1b7d3ccbc119ea43dc7b252114e1bf97cd0a212f6fb02231a0e7b93811461a43'
            'a144e4421b81b713837f19e0ee2ee9d3ff8f8142c7c276403e06200959e2ca3b')

package() {

    mkdir -p "$pkgdir"/usr/lib
    cp -r $pkgname "$pkgdir"/usr/lib/$pkgname

    mkdir -p "$pkgdir"/usr/bin
    ln -s /usr/lib/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname

    install -Dm644 $pkgname.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/$pkgname.png
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
