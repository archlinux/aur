# Maintainer: Martino Pilia <martino.pilia@gmail.com>
_pkgname=music21
pkgname=python-$_pkgname
pkgver=5.1.0
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
source=(https://github.com/cuthbertLab/music21/releases/download/v.$pkgver/$_pkgname-$pkgver.tar.gz)
sha512sums=('a3e749d5253ac423d715783da61f66f1f46ca76398233881c5be57fdc5db7aab722cfbe1e639089fb67e105cb6fa25408cba1a6b299b733c244cfe97dfda09ec')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 ${srcdir}/$_pkgname-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root=$pkgdir
}
