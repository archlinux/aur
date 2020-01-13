_name=mnnpy
pkgname=python-$_name
pkgver=0.1.9.5
pkgrel=1
pkgdesc='Mutual nearest neighbors correction in python'
arch=(any)
url="https://github.com/chriscainx/$_name"
license=(BSD)
depends=(python-numpy python-scipy python-anndata python-pandas python-numba)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('41cdafaf21392144b683d7acf99f7a1fc59085f9b3697cd6ace57f40dddace9c')

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
