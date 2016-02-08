pkgname=unicodemoticon
pkgver=2.1.1
pkgrel=4
pkgdesc="Like a Color Picker but for Unicode Emoticons. Trayicon with Unicode Emoticons using Python3 Qt5."
url="https://github.com/juancarlospaco/unicodemoticon"
depends=('python' 'python-pyqt5')
optdepends=(
	'ttf-symbola: Font with emoji'
	'noto-fonts-emoji: Another font with emoji'
	'noto-fonts: Fonts designed to cover a wide unicode range'
	'ttf-freefont: Another font covering a wide unicode range'
	'ttf-ancient-fonts: Contains ttf-symbola and yet more fonts covering a wide unicode range'
)
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
