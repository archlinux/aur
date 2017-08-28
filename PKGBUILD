# Maintainer: Martino Pilia <martino.pilia@gmail.com>
_pkgname=music21
pkgname=python-$_pkgname
pkgver=4.1.0
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
source=(https://github.com/cuthbertLab/music21/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz)
sha512sums=('3acfc096c2ff67338b08b4cb15904c638c6ab975d5c1dfec26588d415072c3cf3869ec0641e7f13c4800b728f5bfd041a5ce721c4a3e20f8d4ee6df8e7dc09e2')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 ${srcdir}/$_pkgname-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --root="$pkgdir"
}
sha512sums=('9be1cab600b92774ea18354ac473ecb27550ecf135719fe38d203462110d10cdedf666196beed29bdc6bdcb125f7424927c30bcc4ed128ce6dcdf6c3ad22197b')
