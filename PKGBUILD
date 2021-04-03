# Maintainer: Saghm Rossi <saghmrossi@gmail.com>
# Previous Maintainer: Peter Hoeg <first name at last name dot com>
# Contributer: Vincent Demeester <vincent@sbr.io>
# Contributer: Alex Ogier <alex.ogier@gmail.com>
pkgname=ruby-build
pkgver=20210309
pkgrel=1
_file="${pkgname}-v${pkgver}.tar.gz"
pkgdesc="Compile and install Ruby"
arch=('any')
url="https://github.com/rbenv/ruby-build"
license=('MIT')
depends=('bash')
optdepends=('git: install ruby from git')
source=($_file::$url/archive/v$pkgver.tar.gz)
sha512sums=('241a62b3cb34267b7ef730bed59c260360f8d0d86c14db3c663336b6801e3b64d30e43b87137079487887ade905816e05cbf89434fd0745e999b3765baa7c124')

build() {
  cd $srcdir
  tar -x --strip-components 1 -zf "${_file}"
}

package() {
  cd $srcdir
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PREFIX="$pkgdir/usr" ./install.sh
}
