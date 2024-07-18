# Maintainer: Saghm Rossi <saghmrossi@gmail.com>
# Contributor: Peter Hoeg <first name at last name dot com>
# Contributer: Vincent Demeester <vincent@sbr.io>
# Contributer: Alex Ogier <alex.ogier@gmail.com>
pkgname=ruby-build
pkgver=20240709.1
pkgrel=1
_file="${pkgname}-v${pkgver}.tar.gz"
pkgdesc="Compile and install Ruby"
arch=('any')
url="https://github.com/rbenv/ruby-build"
license=('MIT')
depends=('bash')
optdepends=(
    'git: install ruby from git'
    'libyaml: install recent versions of mri'
)
source=($_file::$url/archive/v$pkgver.tar.gz)
sha512sums=('72661fa8d37a7d6112f90ef4484900a9f7d3b76652b24c7581858cd9a1aca2324830ba50c962149c9d146c22298580e4c89ae943a1525989ab6007c9a4117b42')

build() {
  cd $srcdir
  tar -x --strip-components 1 -zf "${_file}"
}

package() {
  cd $srcdir
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PREFIX="$pkgdir/usr" ./install.sh
}
