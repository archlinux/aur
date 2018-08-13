# Maintainer: Martino Pilia <martino.pilia@gmail.com>
_pkgname=music21
pkgname=python-$_pkgname
pkgver=5.3.0
pkgrel=1
pkgdesc="A toolkit for computer-aided musical analysis"
arch=('any')
url="http://web.mit.edu/music21"
license=('BSD')
depends=('python')
optdepends=('python-matplotlib: graphing support'
            'python-scipy: scientific extension to Python'
            'python-pyaudio: allows for recording within Python'
            'python-pygame: allows for realtime MIDI performance'
            'python-pillow: resources for transforming and editing graphics files'
            'lilypond: automatically generate PDF or PNG files')
makedepends=('python-setuptools')
source=("https://github.com/cuthbertLab/music21/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha512sums=('4ec4caf0a915ac8483e3d55b69db391be3d76728cdbf2d9a47b323ede61594a4dc01d4685936c11bc6c2bb456b50b8777928a457608406ea4778f575285d916c')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 ${srcdir}/$_pkgname-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root=$pkgdir
}
