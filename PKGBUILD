# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname=python-godaddypy
_name=${pkgname#python-}
pkgver=2.5.2
pkgrel='3'
pkgdesc="Library useful for updating DNS settings through the GoDaddy v1 API"
arch=('any')
url="https://github.com/eXamadeus/godaddypy/"
license=('BSD-3-Clause')
depends=('python')
makedepends=("python-build" "python-installer" "python-wheel")
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eXamadeus/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('7afa9716f31034d2a7bc96fa9b29959627b29b693a3ff28f6b2f74304e105d16')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
