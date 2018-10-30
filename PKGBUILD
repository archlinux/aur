# Maintainer: Martino Pilia <martino.pilia@gmail.com>
_pkgname=music21
pkgname=python-$_pkgname
pkgver=5.5
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
source=("https://github.com/cuthbertLab/music21/archive/v${pkgver}.tar.gz")
sha256sums=('be5faf6b673c6cdc75799312e2a78d12b094a415ba8e72069b85989f8d18a1fb')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 ${srcdir}/$_pkgname-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root=$pkgdir
}
