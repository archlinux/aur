_name=umap-learn
pkgname=python-$_name
pkgver=0.3.0
pkgrel=1
pkgdesc='Uniform Manifold Approximation and Projection'
arch=(any)
url="https://github.com/lmcinnes/umap"
license=(BSD)
depends=(python-scipy python-scikit-learn python-numba)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('40d8522a301a7691789601fb009c8696141e0aab1ebb648614d7180a7f792225')

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
