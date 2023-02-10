# Maintainer: Saghm Rossi <saghmrossi@gmail.com>
# Contributor: Peter Hoeg <first name at last name dot com>
# Contributer: Vincent Demeester <vincent@sbr.io>
# Contributer: Alex Ogier <alex.ogier@gmail.com>
pkgname=ruby-build
pkgver=20230208.1
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
sha512sums=('ec822a32de0ca51dcc88a25e82d632ad432ef3ca8e6bfaedbfaf9d2b0ce2235f8a7251655c976f02575fa16ad41848f60f854d71fe06aa3ba67724d67380e36f')

build() {
  cd $srcdir
  tar -x --strip-components 1 -zf "${_file}"
}

package() {
  cd $srcdir
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PREFIX="$pkgdir/usr" ./install.sh
}
