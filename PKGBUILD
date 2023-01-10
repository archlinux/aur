pkgname=python-pyctr
pkgver=0.6.0
pkgrel=2
pkgdesc="Python library to interact with Nintendo 3DS files"
arch=($CARCH)
license=('MIT')
url='https://github.com/ihaveamac/pyctr'
depends=('python>=3.6' 'python-pycryptodomex')
makedepends=('python-setuptools')
optdepends=('python-pillow: to convert SMDH icons to standard image formats')
options=(!strip)
source=("pyctr-${pkgver}.tar.gz::https://github.com/ihaveamac/pyctr/archive/v${pkgver}.tar.gz")
sha256sums=('a0d44c0f7631589940ec47ac3d14f3c5306404b3276ebdcb1ebf590e222902d0')
sha512sums=('3d9da3d00e59cb0a6455d3aeb305ecc8fb8f8329c667d2aff70da0617dd22bae6c25cbc69b4a423405f69b8decc65c50cc0a129584dc61b3e8061cfe0c3d8826')

build() {
	cd pyctr-${pkgver}
	python setup.py build
}

package() {
	cd pyctr-${pkgver}
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
