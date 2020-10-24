# Maintainer: Martino Pilia <martino.pilia@gmail.com>
_pkgname=music21
pkgname=python-$_pkgname
pkgver=6.1.0
pkgrel=1
pkgdesc="A toolkit for computer-aided musical analysis"
arch=('any')
url="http://web.mit.edu/music21"
license=('BSD')
depends=(
	'python-chardet'
	'python-joblib'
	'python-more-itertools'
	'python-webcolors'
)
optdepends=(
	'lilypond: PDF or PNG output with music21.converter'
	'python-jsonpickle: pickle and unpickle objects with music21.freezeThaw'
	'python-matplotlib: graphing support'
	'python-pillow: high quality output from LilyPond'
	'python-pyaudio: allows recording with music21.audioSearch'
	'python-pygame: allows realtime MIDI performance with music21.midi'
	'python-scipy: faster FFT for music21.audioSearch'
)
makedepends=('python-setuptools')
source=("https://github.com/cuthbertLab/music21/archive/v${pkgver}.tar.gz")
sha256sums=('2b389dccf3615c030de89512f176d6d8e09995a3e453371b87fb386cefb000d6')

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	install -D -m644 \
		"${srcdir}/$_pkgname-$pkgver/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	python setup.py install --optimize=1 --root="$pkgdir"
}
