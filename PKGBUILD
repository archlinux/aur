# Maintainer: Saghm Rossi <saghmrossi@gmail.com>
# Previous Maintainer: Peter Hoeg <first name at last name dot com>
# Contributer: Vincent Demeester <vincent@sbr.io>
# Contributer: Alex Ogier <alex.ogier@gmail.com>
pkgname=ruby-build
pkgver=20210801
pkgrel=1
_file="${pkgname}-v${pkgver}.tar.gz"
pkgdesc="Compile and install Ruby"
arch=('any')
url="https://github.com/rbenv/ruby-build"
license=('MIT')
depends=('bash')
optdepends=('git: install ruby from git')
source=($_file::$url/archive/v$pkgver.tar.gz)
sha512sums=('6907e964bffc537971ff7c51be184f98ed4508a814b2dfe0fb2722319ed600ed9a51487c2c90703c01482c4847b61626ab56639a56f68b9e45fa7b2d051ce3ae')

build() {
  cd $srcdir
  tar -x --strip-components 1 -zf "${_file}"
}

package() {
  cd $srcdir
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PREFIX="$pkgdir/usr" ./install.sh
}
