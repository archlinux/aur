pkgname=unicodemoticon
pkgver=2.1.1
pkgrel=1
pkgdesc="Like a Color Picker but for Unicode Emoticons. Trayicon with Unicode Emoticons using Python3 Qt5."
url="https://github.com/juancarlospaco/unicodemoticon"
depends=('python' 'python-pyqt5')
optdepends=('ttf-symbola: Font with emoji')
makedepends=('python-distribute')
license=('GPL')
arch=('any')
source=("https://github.com/juancarlospaco/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('3603a6f771d86d8dc847405810cec9a694da5b0b1eb74f9135eb67dc0497c5e2')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}


package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm755 unicodemoticon/unicodemoticon.desktop "$pkgdir/usr/share/applications/unicodemoticon.desktop"
}
