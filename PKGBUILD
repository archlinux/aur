# Maintainer: hawkeye116477 <hawkeye116477 at gmail.com>
_pkgname=DemonEditor
pkgname=demoneditor-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Enigma2 channel and satellite list editor."
url="https://dyefremov.github.io/DemonEditor/"
license=('MIT')
depends=('python>=3.6' 'gtk3>=3.22' 'python-gobject' 'python-requests')
optdepends=('python-pillow' 'python-chardet')
arch=('any')
source=(
	"https://github.com/DYefremov/$_pkgname/releases/download/$pkgver-b$pkgrel/$_pkgname-$pkgver-Beta.deb"
  "https://raw.githubusercontent.com/DYefremov/DemonEditor/master/LICENSE"
)
sha256sums=('351037ef6b10a6fbe0edcca090f02d907c1d0a05a18b5cda4b2a022b2b4e9da7'
            '04d9540a8d545d279f7857fa54f90c5f79f3ff3db261410e9aa8329447b81500')

prepare() {
    tar -xf data.tar.xz
}

package()
{
  cd "$srcdir"
  cp -R "$srcdir"/usr "$pkgdir"/
  install -Dm644 "$srcdir"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
