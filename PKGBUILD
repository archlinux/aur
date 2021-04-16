# Maintainer: Benoit Pierre <benoit.pierre@gmail.com>

pkgname=plover_plugins_manager
pkgdesc="Plugins manager for Plover."
pkgver=0.6.1
pkgrel=1
arch=('any')
license=('GPL2')
depends=(
  plover-git
  python
  python-cmarkgfm
  python-pip
  python-pkginfo
  python-pygments
  python-pyqt5
  python-readme-renderer
  python-requests
  python-requests-cache 
  python-requests-futures
  python-setuptools
  python-wheel
  qt5-svg
)
makedepends=(
  python-setuptools
)
url="https://github.com/benoit-pierre/plover_plugins_manager"
_pkgdist="$pkgname-$pkgver"
source=($_pkgdist.zip::https://github.com/benoit-pierre/$pkgname/archive/$pkgver.zip)
sha256sums=('8e751ea4d1a224ee85e29f4c3bd4858ca3d89db7e94c88ce72c4456a4c5dc684')

build() {
  cd "$_pkgdist"
  python setup.py build
}

package() {
  cd "$_pkgdist"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  chmod og+rX -R "$pkgdir"
}

# vim:set sw=2 sts=2 et:
