# Maintainer: gandalf3 <gandalf3@blendermonkey.com>

pkgname=rganalysis
pkgver=3.6
pkgrel=1
pkgdesc='Add Replay Gain tags to your whole music library'
arch=('any')
url='https://github.com/DarwinAwardWinner/rganalysis'
license=('GPL2')
depends=('python' 'python-plac' 'python-mutagen' 'python-parse')
optdepends=('python-tqdm: Progress bars'
				'audiotools: Backend for computing gain'
				'bs1770gain: Backend for computing gain')
makedepends=('python-setuptools')
install=${pkgname}.install
source=("https://github.com/DarwinAwardWinner/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4268fbaebac9d38fe7680e95a50df967b2b84590264c974fbde88f0a2c65c7d3')

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}
