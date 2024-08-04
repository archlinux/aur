# Maintainer: Victor Lavaud <victor.lavaud@pm.me>
pkgname=python-nord_pygments
_name=${pkgname##python-}
pkgver=0.1
pkgrel=1
pkgdesc="Nord highlighting style for Pygments"
arch=(any)
url="https://github.com/sbrisard/${_name}"
license=(MIT)
groups=()
depends=()
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("nord_pygments.tar.gz::https://github.com/sbrisard/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('02632c9c0159e01a7f0ed268325814769a7b2d34cf4deceb8a129bc81fd1eaaa')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}" 
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
