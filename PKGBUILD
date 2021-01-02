# Maintainer : Frederik Wegner <wegnerfrederik at gmail dot com>
pkgname=python-test-tube
_name=${pkgname#python-}
pkgver=0.7.5
pkgrel=1
pkgdesc="Machine learning / data science experiments logger and visualizer for pytorch."
arch=('any')
url="https://github.com/williamFalcon/test-tube"
license=('MIT')
depends=('python' 'python-numpy' 'python-pytorch' 'python-pandas' 'python-imageio' 'python-tensorboardx' 'python-future')
optdepends=()
provides=('python-test-tube')
conflicts=('python-test-tube')
makedepends=('python-setuptools')
source+=("https://github.com/williamFalcon/test_tube/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
	cd $srcdir/$_name-$pkgver
	install -D -m644 LICENSE "${pkgdir}/usr/share/license/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
