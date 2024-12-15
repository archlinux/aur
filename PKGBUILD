# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname=python-godaddypy
_name=${pkgname#python-}
pkgver=2.3.3
pkgrel=1
pkgdesc="Library useful for updating DNS settings through the GoDaddy v1 API"
arch=('any')
url="https://github.com/eXamadeus/godaddypy/"
license=('GPL')
depends=('python')
makedepends=("python-build" "python-installer" "python-wheel")
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eXamadeus/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('ef7b633ea02cf977c3e02bea37db883ea8b9884ef37ba3bf5e4a61259d232fbd')

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
