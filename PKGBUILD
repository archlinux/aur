# Maintainer: SZanko, szanko at protonmail dot com

pkgname=jakym
pkgver=0.4.0
pkgrel=1
pkgdesc="Algorithms to compute the inverse Radon transform (e.g. SART, backprojection, Fourier interpolation)."
arch=('any')
url="https://github.com/themayankjha/JAKYM"
license=('GPL3')
depends=(
	'python'
	'python-setuptools'
	'python-pip'
	'ffmpeg'
	'youtube-dl'
	'python-pyfiglet'
	'python-pydub'
	'python-termcolor'
	'python-beautifulsoup4'
	'python-colorama'
	'python-lxml'
	'python-simpleaudio'
	)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('186bc3cdc4af275b53e9253ea5626b9f863760b3ec4dca02a418e23eb6524a0c')

build() {
	cd "${srcdir}/${pkgname^^}-${pkgver}"
	python setup.py build
}

package() {
    cd "${srcdir}/${pkgname^^}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
