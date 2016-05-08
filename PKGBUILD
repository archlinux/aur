# Contributor: Kashif <kashifb+aur@gmail.com>
pkgname=python2-matplotlib2tikz
pkgver=0.5.7
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/nschloe/matplotlib2tikz"
depends=('python2' 'python2-numpy' 'python2-matplotlib>=1.4.0' 'python2-pillow')
makedepends=('python2')
license=('MIT')
arch=('any')
source=("https://github.com/nschloe/matplotlib2tikz/archive/v${pkgver}.tar.gz")
sha256sums=('b5378b947c1d7ce3eb30c3bf4a5e4a9034a623d3d4d38b6e10b43c3cd0f083d7')

build() {
  cd "${srcdir}/matplotlib2tikz-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/matplotlib2tikz-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
