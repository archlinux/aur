# Maintainer: hawkeye116477 <hawkeye116477 at gmail.com>
_pkgname=DemonEditor
pkgname=demoneditor-bin
pkgver=3.10.2
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
sha256sums=('77f3ce9adebec4fa539e68fbcdcde8d6b8f2155e95bdd9b227e4224c00708dd8'
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
