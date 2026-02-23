# Maintainer: link2xt <link2xt@testrun.org>
pkgname=pwdsphinx
pkgver=2.0.4
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
b2sums=('918ee20c4af6c67268ba799dcbcc14076f611c1f1c05fbb1a4f37140223ea28c0090229cf3e477c72b21b65b789a4267161d09e139490644b983409d1b3117a3'
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
