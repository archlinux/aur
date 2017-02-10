# Maintainer: Javier Torres <jtorres@carto.com>
pkgname=python2-pysal
pkgver=1.13.0
pkgrel=1
pkgdesc='Cross-platform library of spatial analysis functions'
arch=('any')
url='http://pysal.org/'
license=('BSD')
depends=('python2' 'python2-setuptools' 'python2-scipy' 'python2-numpy')
options=(!emptydirs)
source=("https://github.com/pysal/pysal/archive/v${pkgver}.tar.gz")
sha256sums=('d4336a3eab927ef17b5375a77c41498fd8edfcfd88eb8e2ae687c41714c2b6cb')

package() {
	cd "${srcdir}/pysal-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
	install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
