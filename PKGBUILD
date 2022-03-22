# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >

pkgname=android2po
pkgver=1.6.0
pkgrel=1
pkgdesc="Convert Android string resources to gettext, and back."
arch=('any')
url="https://github.com/miracle2k/$pkgname"
license=('BSD')
_pkgver_or_commit=69b36b484ae9d1281787de67cbaef37bde788cc5
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver_or_commit.tar.gz")
sha256sums=('aee4db8a20a59001bb648a25e35f92dae3ecd6e690663af37a7e046ccb8f2963')
depends=('python' 'python-babel' 'python-colorama' 'python-lxml' 'python-termcolor')
makedepends=('python-setuptools')

build() {
  cd "$pkgname-$_pkgver_or_commit"
  python setup.py build
}

package() {
  cd "$pkgname-$_pkgver_or_commit"
  python setup.py install --prefix=/usr --root="$pkgdir"
  install -D -m644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
