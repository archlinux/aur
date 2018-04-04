# Contributor: sasvari <sasvari@fastmail.com>
pkgname=python2-matplotlib2tikz-git
pkgver=0.6.16
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/nschloe/matplotlib2tikz"
depends=('python2' 'python2-numpy' 'python2-matplotlib>=1.4.0' 'python2-pillow')
makedepends=('python2')
provides=('python2-matplotlib2tikz')
conflicts=('python2-matplotlib2tikz')
license=('MIT')
arch=('any')
source=("git+https://github.com/nschloe/matplotlib2tikz.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/matplotlib2tikz"
  python2 setup.py build
}

pkgver() {
	cd "$srcdir/matplotlib2tikz"
	git describe --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

#package() {
#  cd "${srcdir}/matplotlib2tikz-${pkgver}"
#  python2 setup.py install --root="${pkgdir}" --optimize=1
#  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
#}
package() {
	cd "$srcdir/matplotlib2tikz"
	python2 setup.py install --root="$pkgdir/" --prefix="/usr"
}
