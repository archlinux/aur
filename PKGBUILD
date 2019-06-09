# Maintainer: Martino Pilia <martino.pilia@gmail.com>
_pkgname=music21
pkgname=python-$_pkgname
pkgver=5.7.0
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
sha256sums=('c66d9397da87a29a5ea883e6b6689522d2c4732b98f8da0437e8bac7b6e8d673')

package() {
	cd "$srcdir/$_pkgname-$pkgver" || exit 1

	install -D -m644 \
		"${srcdir}/$_pkgname-$pkgver/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	python setup.py install --optimize=1 --root="$pkgdir"
}
