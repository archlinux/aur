# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=graphqlmap
pkgname=graphqlmap-git
pkgver=r44.87b5626
pkgrel=3
pkgdesc="scripting engine to interact with a GraphQL endpoint for pentesting purposes"
arch=('any')
url="https://github.com/swisskyrepo/GraphQLmap"
license=('MIT')
depends=(
  'python'
  'python-argparse'
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
	https://github.com/swisskyrepo/$_pyname.git
)
sha512sums=('28a6def2655bc71b0914231d779d2efa140a6fd9c5b1c2de1361cd4669cff251bd6052ac1d3bf988f9f554f44c8e71176b3099327e922cee5794ac82de3cb317')

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
