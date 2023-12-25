# Maintainer: Saghm Rossi <saghmrossi@gmail.com>
# Contributor: Peter Hoeg <first name at last name dot com>
# Contributer: Vincent Demeester <vincent@sbr.io>
# Contributer: Alex Ogier <alex.ogier@gmail.com>
pkgname=ruby-build
pkgver=20231225
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
sha512sums=('00eea9942dc2165e14b872eb183639f515adddc18183ed8a7b2788c96db68fe8f7d3c7936f43a72c8b12543dea470d886191ba890cdd2146fdd7b60e6e69264e')

build() {
  cd $srcdir
  tar -x --strip-components 1 -zf "${_file}"
}

package() {
  cd $srcdir
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PREFIX="$pkgdir/usr" ./install.sh
}
