# Maintainer: hawkeye116477 <hawkeye116477 at gmail.com>
_pkgname=DemonEditor
pkgname=demoneditor-bin
pkgver=3.8.0
pkgrel=1
pkgdesc="Enigma2 channel and satellite list editor."
url="https://dyefremov.github.io/DemonEditor/"
license=('MIT')
depends=('python>=3.6' 'gtk3>=3.22' 'python-gobject' 'python-requests')
optdepends=('python-pillow' 'python-chardet')
arch=('any')
source=(
	"https://github.com/DYefremov/$_pkgname/releases/download/$pkgver-b$pkgrel/$_pkgname-$pkgver-Beta.deb"
  "https://raw.githubusercontent.com/DYefremov/DemonEditor/$pkgver-b$pkgrel/LICENSE"
)
sha256sums=('c056f1dce23621dba0b816d2c7307ed7ba7960937b7cfd4ea169d5aa5d27e556'
            '2209a6597b6e8662386512435ffce07289926d496e7782c930285fcf9879deb6')

prepare() {
    tar -xf data.tar.xz
}

package()
{
  cd "$srcdir"
  cp -R "$srcdir"/usr "$pkgdir"/
  install -Dm644 "$srcdir"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
