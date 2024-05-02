# Maintainer: Saghm Rossi <saghmrossi@gmail.com>
# Contributor: Peter Hoeg <first name at last name dot com>
# Contributer: Vincent Demeester <vincent@sbr.io>
# Contributer: Alex Ogier <alex.ogier@gmail.com>
pkgname=ruby-build
pkgver=20240501
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
sha512sums=('f761779efd353b91ca49c30746b9009eefa7b31f114a0ddb60112b3e54c6e11692cf71089ca25ecd1fd3c86ad62aa1d0da9c0382205addc75b89cd394a21bb2d')

build() {
  cd $srcdir
  tar -x --strip-components 1 -zf "${_file}"
}

package() {
  cd $srcdir
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PREFIX="$pkgdir/usr" ./install.sh
}
