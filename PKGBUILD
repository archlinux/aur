# Maintainer: Javier Torres <jtorres@carto.com>
pkgname=python2-pysal
pkgver=1.14.2
pkgrel=1
pkgdesc='Cross-platform library of spatial analysis functions'
arch=('any')
url='http://pysal.org/'
license=('BSD')
depends=('python2' 'python2-setuptools' 'python2-scipy' 'python2-numpy')
options=(!emptydirs)
source=("https://github.com/pysal/pysal/archive/v${pkgver}.tar.gz")
sha256sums=('7cea04d42702084777b63389901973579d1d62f7c8d6fe2e999dbb0edd1261cd')

package() {
	cd "${srcdir}/pysal-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
	install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
