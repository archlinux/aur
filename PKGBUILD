# Maintainer: lerentis <lerentis+aur@uploadfilter24.eu>
# Ex-Maintainer:: Nikita Tarasov <nikatar@disroot.org>
pkgname=krr
pkgver=1.31.3
pkgrel=1
pkgdesc="Kubernetes requests recommendations"
arch=('any')
url="https://github.com/robusta-dev/krr"
license=('MIT')
depends=(
  'python>=3.9'
)
makedepends=(
  'unzip'
)
provides=("krr=$pkgver")
options=(!emptydirs !makeflags !strip !debug)
source=("https://github.com/robusta-dev/krr/releases/download/v$pkgver/krr-ubuntu-latest-v$pkgver.zip")
noextract=(krr-ubuntu-latest-v$pkgver.zip)
sha256sums=('11e22ffd93aa53d3816a636ba61a42121108a48e7f4cc183779cf742a8c2033a')
#validpgpkeys=('85F86E317555BECC1C2184BF2C45BA09ABC5D7DA')

package() {
  unzip $srcdir/krr-ubuntu-latest-v$pkgver.zip -d $pkgdir/opt/
  mkdir -p $pkgdir/usr/local/bin
  ln -s /opt/krr/krr "$pkgdir/usr/local/bin/krr"
}
