# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=auditwheel
pkgver=1.7.0
pkgrel=1
pkgdesc='Cross-distribution Linux wheels'
arch=(any)
url="https://github.com/pypa/auditwheel"
license=(MIT)
depends=(python python-elftools)
makedepends=('python-pip')
_wheel="$pkgname-$pkgver-py3-none-any.whl"
#source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
source=("https://files.pythonhosted.org/packages/14/76/290bbad9533b5749d37863008b811bb625ff3c2e76fcd8e7b9f492bf39dc/$_wheel")
noextract=("$_wheel")
sha256sums=('92b4e9bd2624c5ba06149cb186702d1dffed08bfc19d467a19291007722d0ebb')

package() {
	pip install --compile --no-deps --root="$pkgdir" "$_wheel"
}
