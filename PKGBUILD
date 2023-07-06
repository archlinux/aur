# Maintainer: Rudy Matela <rudy@matela.com.br>
# Contributor: Rudy Matela <rudy@matela.com.br>

pkgname=python-crepes
pkgver=0.6.0
pkgrel=1
pkgdesc='Python support for conformal classifiers, regressors, and predictive systems'
arch=(x86_64)
url='https://crepes.readthedocs.io/'
_url='https://github.com/henrikbostrom/crepes'
license=(BSD)
depends=(python-setuptools
         python-wheel)
makedepends=()
_archive="${pkgname#python-}-$pkgver"
source=("https://github.com/henrikbostrom/crepes/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('71bda04e598f2ed3e0053ff308595d6bc96b353b110ab316bc18db0ab8e2b880')

package() {
	cd $_archive
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
