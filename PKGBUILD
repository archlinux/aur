# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-resumable-media

pkgname=python-google-resumable-media
pkgver=2.0.2
pkgrel=1
pkgdesc="Utilities for Google Media Downloads and Resumable Uploads"
arch=('any')
url="https://github.com/googleapis/google-resumable-media-python"
license=('Apache')
depends=(
	'python>=3.6'
	'python-google-crc32c>=1.0'
	'python-google-crc32c<=1.1.2')
makedepends=('python-setuptools')
optdepends=(
	'python-requests>=2.18.0: for requests support'
	'python-aiohttp>=3.6.2: for aiohttp support')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('36d682161fdcbfa29681212c210fabecbf6849a505a0cbc54b7f70a10a5278a2')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
