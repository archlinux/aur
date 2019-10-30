# Maintainer: Saghm Rossi <saghmrossi@gmail.com>
# Previous Maintainer: Peter Hoeg <first name at last name dot com>
# Contributer: Vincent Demeester <vincent@sbr.io>
# Contributer: Alex Ogier <alex.ogier@gmail.com>
pkgname=ruby-build
pkgver=20191024
pkgrel=1
_file="${pkgname}-v${pkgver}.tar.gz"
pkgdesc="Compile and install Ruby"
arch=('any')
url="${_file}::https://github.com/rbenv/ruby-build"
license=('MIT')
depends=('bash')
optdepends=('git: install ruby from git')
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('785c16ccfbc6c5a9160dc912377cea8d0341b311dd0523cb700da06b72cbc9803c096331ec56854b32942c890d44304d6ffe99db9bd2650dad465fb9406ebf7c')

build() {
  cd $srcdir
  tar -x --strip-components 1 -zf "${_file}"
}

package() {
  cd $srcdir
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PREFIX="$pkgdir/usr" ./install.sh
}
