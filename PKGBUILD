# Maintainer: Mark E.A. <evalapply ``dot'' aur ``at'' airmail ``dot'' cc>

pkgname=python2-cyvlfeat
_pyname=cyvlfeat
pkgver=0.4.4
pkgrel=1
pkgdesc='A thin Cython wrapper around select areas of vlfeat'
arch=('any')
url='https://github.com/menpo/cyvlfeat/'
license=('BSD')
depends=('cython2>=0.22'
	'python2-numpy>=1.9'
	'vlfeat>=0.9.20')
makedepends=()
optdepends=()
source=("https://github.com/menpo/${_pyname}/archive/v${pkgver}.tar.gz")
sha256sums=('323867011e83f3987d2825ba928d90d1ee45f466bcb5f5257b799c08ffc2eeed')

build() {
	cd "$_pyname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$_pyname-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
