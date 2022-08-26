# Maintainer: Saghm Rossi <saghmrossi@gmail.com>
# Contributor: Peter Hoeg <first name at last name dot com>
# Contributer: Vincent Demeester <vincent@sbr.io>
# Contributer: Alex Ogier <alex.ogier@gmail.com>
pkgname=ruby-build
pkgver=20220825
pkgrel=1
_file="${pkgname}-v${pkgver}.tar.gz"
pkgdesc="Compile and install Ruby"
arch=('any')
url="https://github.com/rbenv/ruby-build"
license=('MIT')
depends=('bash')
optdepends=('git: install ruby from git')
source=($_file::$url/archive/v$pkgver.tar.gz)
sha512sums=('47f97993e7bb0a3e290090e21ebb24b755c9c4b34a046549bc40670760872b4ad33183cb5e1cbc6435b0beb86ec19c6bb43df2c979d14e1226d4b9d1a9a16afd')

build() {
  cd $srcdir
  tar -x --strip-components 1 -zf "${_file}"
}

package() {
  cd $srcdir
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PREFIX="$pkgdir/usr" ./install.sh
}
