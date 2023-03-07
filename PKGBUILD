# Maintainer: Alld Ovina <allddd (at) proton (dot) me>
pkgname=autolibheif
pkgver=1.1.2
pkgrel=1
pkgdesc="CLI utility for encoding and decoding the HEIF/HEIC file format"
arch=('x86_64')
url="https://github.com/allddd/autolibheif"
license=('MIT')
depends=('libheif' 'python>=3.6.0' 'libpng' 'libjpeg-turbo')
makedepends=('python-setuptools')
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('9014f37dbf704a5cd6a2de070ed773d0fc76300975a11c5116a2a67f86cc3b6f')

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
