pkgname=python-pyctr
pkgver=0.7.6
pkgrel=1
pkgdesc="Python library to interact with Nintendo 3DS files"
arch=($CARCH)
license=('MIT')
url='https://github.com/ihaveamac/pyctr'
depends=('python>=3.8' 'python-pycryptodomex')
makedepends=('python-setuptools')
optdepends=('python-pillow: to convert SMDH icons to standard image formats')
options=(!strip)
source=("pyctr-${pkgver}.tar.gz::https://github.com/ihaveamac/pyctr/archive/v${pkgver}.tar.gz")
sha256sums=('b3032ef898c1b090937b23a551dcc40a3f633dc996ab6dff18021a083e92da51')
sha512sums=('b955ca10157c9db889c215dc24721a457c8dc5e667d3d09a39cd9df560d3af8008b95f9a82484a3dfccb0107c3a8447ea29d808161dffab39bd2091a3c5773b6')


build() {
	cd pyctr-${pkgver}
	python setup.py build
}

package() {
	cd pyctr-${pkgver}
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
