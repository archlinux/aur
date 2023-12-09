# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=graphqlmap
pkgname=graphqlmap-git
pkgver=r63.59305d7
pkgrel=1
pkgdesc="scripting engine to interact with a GraphQL endpoint for pentesting purposes"
arch=('any')
url="https://github.com/swisskyrepo/GraphQLmap"
license=('MIT')
depends=(
  'python'
  'python-requests'
  'python-rl'
)
makedepends=(
  'git'
  'python-setuptools'
)
provides=("$_pyname")
conflicts=(graphqlmap)
options=(!emptydirs)
source=(
	git+https://github.com/swisskyrepo/$_pyname.git
)
sha512sums=('SKIP')

pkgver() {
  cd "$_pyname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pyname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
