# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pydensecrf
pkgname=python-$_pkgname-git
pkgver=r82.0632813
pkgrel=1
pkgdesc="Python wrapper to Philipp Krähenbühl's dense CRFs with Gaussian edge potentials"
arch=('any')
url="https://github.com/lucasb-eyer/pydensecrf"
license=('MIT')
depends=('python-numpy')
optdepends=()
makedepends=('python-setuptools' 'cython' 'git')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
