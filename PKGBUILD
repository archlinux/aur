pkgname=unicodemoticon
pkgver=1.0.2
pkgrel=1
pkgdesc='Tray icon with Unicode Emoticons using Python3 Qt5 '
url='https://github.com/juancarlospaco/unicodemoticon'
arch=('any')
license=('Apache')
depends=('python' 'python-pyqt5')
optdepends=('ttf-symbola: Font with emoji')
makedepends=('python-distribute')
source=("https://pypi.python.org/packages/source/u/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('0069de8fa1300d5cc1e7aeee713f316f')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	python -c 'import unicodemoticon; print(unicodemoticon.AUTOSTART_DESKTOP_FILE)' > unicodemoticon.desktop
	
	install -Dm755 unicodemoticon.desktop "$pkgdir/usr/share/applications/unicodemoticon.desktop"
	install -Dm755 unicodemoticon.py "$pkgdir/usr/bin/unicodemoticon.py"
}