# Maintainer: Saghm Rossi <saghmrossi@gmail.com>
# Previous Maintainer: Peter Hoeg <first name at last name dot com>
# Contributer: Vincent Demeester <vincent@sbr.io>
# Contributer: Alex Ogier <alex.ogier@gmail.com>
pkgname=ruby-build
pkgver=20201208
pkgrel=1
_file="${pkgname}-v${pkgver}.tar.gz"
pkgdesc="Compile and install Ruby"
arch=('any')
url="https://github.com/rbenv/ruby-build"
license=('MIT')
depends=('bash')
optdepends=('git: install ruby from git')
source=($_file::$url/archive/v$pkgver.tar.gz)
sha512sums=('0424d5e7ee4b1fd4280eb2836c337ff35dadeaaf6552279112cab78b627936299269387a86f861b191b8642fb6da026d5995e0110c5d469159ea96b020073d9b')

build() {
  cd $srcdir
  tar -x --strip-components 1 -zf "${_file}"
}

package() {
  cd $srcdir
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PREFIX="$pkgdir/usr" ./install.sh
}
