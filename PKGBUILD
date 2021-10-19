# Maintainer: Benoit Pierre <benoit.pierre@gmail.com>

pkgname=plover_plugins_manager
pkgdesc="Plugins manager for Plover."
pkgver=0.6.3
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
makedepends=()
url="https://github.com/benoit-pierre/plover_plugins_manager"
_pkgdist="$pkgname-$pkgver"
source=("$pkgname-$pkgver.tar.gz::https://github.com/benoit-pierre/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9aeebd2b8de16529638a6a5da95f0c81b3fe87cdbf731ae8c004c7f4f3c1b5df')

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
