# Maintainer: Saghm Rossi <saghmrossi@gmail.com>
# Previous Maintainer: Peter Hoeg <first name at last name dot com>
# Contributer: Vincent Demeester <vincent@sbr.io>
# Contributer: Alex Ogier <alex.ogier@gmail.com>
pkgname=ruby-build
pkgver=20191223
pkgrel=1
_file="${pkgname}-v${pkgver}.tar.gz"
pkgdesc="Compile and install Ruby"
arch=('any')
url="${_file}::https://github.com/rbenv/ruby-build"
license=('MIT')
depends=('bash')
optdepends=('git: install ruby from git')
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('1fa063ee610dc29d5b79bc27f3fe9ea1daa42d3253e2a872942a8b555166f23bf4943fe8501639aa7c8a43618314a2b6ffd306d3506b2ae66f6fd141c2c0b49b')

build() {
  cd $srcdir
  tar -x --strip-components 1 -zf "${_file}"
}

package() {
  cd $srcdir
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PREFIX="$pkgdir/usr" ./install.sh
}
