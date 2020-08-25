_name=umap-learn
pkgname=python-$_name
pkgver=0.4.5
pkgrel=1
pkgdesc='Uniform Manifold Approximation and Projection'
arch=(any)
url="https://github.com/lmcinnes/umap"
license=(BSD)
depends=(python-scipy python-scikit-learn python-numba)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b12fb3518b9d8b0270fd0715a837a67f25a46d81cbb5e570bfbfce9b330a6f98')

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
