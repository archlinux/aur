# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=torchbiomed
pkgname=python-${_pkgname}-git
pkgver=r47.661b3e4
pkgrel=3
pkgdesc="Datasets, Transforms and Utilities specific to Biomedical Imaging"
arch=('any')
url="https://github.com/mattmacy/torchbiomed"
license=('BSD3')
depends=('python-matplotlib' 'python-numpy' 'python-scipy' 'python-scikit-image' 'python-pytorch' 'python-simpleitk' 'python-pandas')
makedepends=('python-setuptools' 'git')
provides=('python-torchbiomed')
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
