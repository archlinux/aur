pkgname=unicodemoticon
pkgver=2.1.1
pkgrel=2
pkgdesc="Like a Color Picker but for Unicode Emoticons. Trayicon with Unicode Emoticons using Python3 Qt5."
url="https://github.com/juancarlospaco/unicodemoticon"
depends=('python' 'python-pyqt5')
optdepends=('ttf-symbola: Font with emoji')
makedepends=('python-distribute')
license=('GPL')
arch=('any')
source=("https://github.com/juancarlospaco/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('625d87e9d73fa1a72b3b029d80f56a63e72b4d56f7bdfebf02ed05f1aa0fef52')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}


package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm755 unicodemoticon/unicodemoticon.desktop "$pkgdir/usr/share/applications/unicodemoticon.desktop"
}
