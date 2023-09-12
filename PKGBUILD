# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-pygments-pasp
_pypiname=pygments-pasp
pkgver=0.0.4
pkgrel=1
pkgdesc="Pygments syntax highlighting for probabilistic ASP"
arch=("any")
url="https://github.com/kamel/pygments-pasp"
license=("MIT")
depends=("python" "python-pygments")
makedepends=("python-setuptools" "python-pygments")
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/pygments_pasp-${pkgver}.tar.gz")
sha256sums=("78fc414bc2ac2d79855283a4393821ac1f7d9dc2179a246ac60d3e2f37fff94c")

build() {
  cd $srcdir/pygments_pasp-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/pygments_pasp-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
