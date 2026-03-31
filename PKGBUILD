# Maintainer: J. Nathanael Philipp (jnphilipp) <jnathanael@philipp.land>

pkgname=python-bikkuri
_pkg="${pkgname#python-}"
pkgver=0.1.0
pkgrel=1
pkgdesc="Calculate the surprisal of words in texts."
url="https://github.com/jnphilipp/bikkuri"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools')
license=('GPL-3.0-or-later')
arch=(any)
source=("$_pkg-$pkgver.tar.gz::https://github.com/jnphilipp/bikkuri/archive/refs/tags/$pkgver.tar.gz")
sha512sums=("e5f94ba0851dcfc4fa1f9ec0d9c8789f7b94a99a345f511f9b0ede68aa55e88461e1b0d348a339fe175420eb09920a71e19589baae05cdda15f7b305fa8841d1")

build() {
	cd $_pkg-$pkgver
    python -m build --wheel --no-isolation
}

package() {
	cd $_pkg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
