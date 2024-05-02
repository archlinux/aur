# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-tcm
_pkg="${pkgname#python-}"
pkgver=0.1.2
pkgrel=1
pkgdesc="Topic Context Model (TCM)."
url="https://github.com/jnphilipp/tcm"
depends=('python-scipy' 'python-scikit-learn')
makedepends=('python-setuptools')
license=('GPLv3+')
arch=(any)
source=("$_pkg-$pkgver.tar.gz::https://github.com/jnphilipp/tcm/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("d4ecf5450ba1f0964ef6b97b03434bf41335a37abbf1aa900072cff7ecd47874")

build() {
	cd $_pkg-$pkgver
    python -m build --wheel --no-isolation
}

package() {
	cd $_pkg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
