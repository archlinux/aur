# Maintainer: Mark E.A. <evalapply ``dot'' aur ``at'' airmail ``dot'' cc>

pkgname=python2-cyvlfeat
_pyname=cyvlfeat
pkgver=0.4.3
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
sha256sums=('0034f220437267e2fa404cea2ed54ce8f1147e5e5ead36f1e45c2ec7e46e90c9')

build() {
	cd "$_pyname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$_pyname-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
