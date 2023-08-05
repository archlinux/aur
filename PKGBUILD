# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-pygments-pasp
_pypiname=pygments-pasp
pkgver=0.0.3
pkgrel=1
pkgdesc="Pygments syntax highlighting for probabilistic ASP"
arch=("any")
url="https://github.com/kamel/pygments-pasp"
license=("MIT")
depends=("python" "python-pygments")
makedepends=("python-setuptools" "python-pygments")
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/pygments_pasp-${pkgver}.tar.gz")
sha256sums=("43ee4c1a34c12c0c5e8e76842965d6fe1e1e564e6c33b8806b640306e27b75d3")

build() {
  cd $srcdir/pygments_pasp-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/pygments_pasp-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
