# Mantainer: Victor <vicgua@outlook.com>

pkgname=edis
pkgver=2.0
pkgrel=1
pkgdesc="a simple cross-platform IDE for C"
arch=('any')
url="http://centaurialpha.github.io/edis"
license=('GPLv3')
depends=('python' 'python-pyqt4' 'python-qscintilla')
makedepends=()
optdepends=('ctags: symbol tree support'
            'cppcheck: static code analysis')
conflicts=(edis-git edis-c edis-c-git)
replaces=(edis-c)
install=$pkgname.install
source=("https://github.com/centaurialpha/$pkgname/archive/v${pkgver}.tar.gz"
        "$pkgname.png"
        "$pkgname.desktop")
md5sums=('44c6f647a2812d4128ed533284a41318'
         'b62bba84e3be425a165f78f4261de1c7'
         '4657b48c3efce21a9e5f8804d4892431')

package() {
	cd $srcdir/$pkgname-$pkgver

	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 "edis.desktop" "$pkgdir/usr/share/applications/edis.desktop"
}
