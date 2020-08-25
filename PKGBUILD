# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-liblarch
pkgver=3.0.1
pkgrel=1
pkgdesc="Python library to easily handle data structure"
arch=('any')
url="https://wiki.gnome.org/action/show/Projects/liblarch"
license=('LGPL3')
depends=('python')
optdepends=()
makedepends=('python' 'python-distribute')
checkdepends=('python-nose')
provides=('python-liblarch_gtk')
conflicts=('python-liblarch_gtk')
source=("https://github.com/liblarch/liblarch/archive/v${pkgver}.tar.gz")
sha256sums=('3a866cc43873454b88ae5526207555aca1f0e16e3120577d6135ea13db98ca68')

check() {
  cd "$srcdir/liblarch-${pkgver}"
  python run-tests
}

package() {
  cd "$srcdir/liblarch-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}


# vim:set ts=2 sw=2 et:
