pkgname=unicodemoticon
pkgver=2.3.4
pkgrel=2
pkgdesc="Like a Color Picker but for Unicode Emoticons. Trayicon with Unicode Emoticons using Python3 Qt5."
url="https://github.com/juancarlospaco/unicodemoticon"
depends=('python' 'python-pyqt5' 'python-anglerfish')
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
source=("https://files.pythonhosted.org/packages/source/u/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('97caf0797231077eec7bbb8c58957a63')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}


package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm755 unicodemoticon/unicodemoticon.desktop "$pkgdir/usr/share/applications/unicodemoticon.desktop"
}
