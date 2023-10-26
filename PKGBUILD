# Maintainer: Saghm Rossi <saghmrossi@gmail.com>
# Contributor: Peter Hoeg <first name at last name dot com>
# Contributer: Vincent Demeester <vincent@sbr.io>
# Contributer: Alex Ogier <alex.ogier@gmail.com>
pkgname=ruby-build
pkgver=20231025
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
sha512sums=('08ed3411687ef0cf34e966ef0adf4e58a4e751ca6a8fd0944843ef2bb7d965cd585e7cb96ace7824f707307c3c8e1efd0230d40afad41a8b9e0d84150847e076')

build() {
  cd $srcdir
  tar -x --strip-components 1 -zf "${_file}"
}

package() {
  cd $srcdir
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PREFIX="$pkgdir/usr" ./install.sh
}
