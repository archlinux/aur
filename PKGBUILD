# Maintainer: Jaume Delclòs <jaume@delclos.com>
pkgname=red-alien
pkgver=2.0.1
pkgrel=1
pkgdesc="A script compiler and editor for Pokémon GBA ROMs"
arch=(any)
url="https://www.cosarara.me/redalien/"
license=('GPL3')
depends=('python' 'python-qscintilla-qt5' 'python-pyqt5')
options=(!emptydirs)
install=red-alien.install
source=("https://github.com/cosarara/red-alien/archive/v${pkgver}.tar.gz")
md5sums=('6f3898d759f96ba49e1e0bb640ffdb04')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 utils/red-alien.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/red-alien.svg"
  install -Dm644 utils/red-alien.desktop "$pkgdir/usr/share/applications/red-alien.desktop"
  install -Dm644 utils/red-alien.xml "$pkgdir/usr/share/mime/packages/red-alien.xml"
}

# vim:set ts=2 sw=2 et:
