# Maintainer: link2xt <link2xt@testrun.org>
pkgname=pwdsphinx
pkgver=2.0.3
pkgrel=1
pkgdesc="SPHINX: A Password Store that Perfectly Hides from Itself (No Xaggeration)"
arch=(x86_64)
url="https://github.com/stef/pwdsphinx"
license=('GPL-3.0-or-later')
depends=(python-securestring python-pysodium python-pyoprf python-qrcodegen python-pyequihash)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=()
optdepends=()
options=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stef/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"https://github.com/stef/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
noextract=()
b2sums=('310bc54e839187d879288cbccbd2334c548337d957e3449d30a5427d0e32f768eac57eb740b1b1549f1d31d3fd97c59d84c382b5449021a2826738dd22d47683'
	'SKIP')
validpgpkeys=('AABDE16CB6AF5CD10A28DFF2970DEB6694D50988')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
