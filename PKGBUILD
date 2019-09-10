_name=umap-learn
pkgname=python-$_name
pkgver=0.3.10
pkgrel=1
pkgdesc='Uniform Manifold Approximation and Projection'
arch=(any)
url="https://github.com/lmcinnes/umap"
license=(BSD)
depends=(python-scipy python-scikit-learn python-numba)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('21ce6b6d7486905318ba6458b5a9ba2cfb935878d30c24e6fba64ee3bd504d09')

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
