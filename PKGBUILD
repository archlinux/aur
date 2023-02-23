# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-pygments-pasp
pkgver=0.0.2
pkgrel=1
pkgdesc="Pygments syntax highlighting for probabilistic ASP"
arch=("any")
url="https://github.com/RenatoGeh/pygments-pasp"
license=("MIT")
depends=("python" "python-pygments")
makedepends=("python-setuptools" "python-pygments")
source=("https://files.pythonhosted.org/packages/bd/c4/bfd8e25e790f11eb3202dc33ceaddd9380b40f3b75404fead67fb4ab0398/pygments_pasp-${pkgver}.tar.gz")
sha256sums=("2cdcde1279408c594ae673a34e58002317334676668f946cead6eb87b6e0a949")

build() {
  cd $srcdir/pygments_pasp-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/pygments_pasp-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
