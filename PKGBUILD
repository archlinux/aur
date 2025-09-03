# Maintainer: lerentis <lerentis+aur@uploadfilter24.eu>
# Ex-Maintainer:: Nikita Tarasov <nikatar@disroot.org>
pkgname=krr
pkgver=1.26.1
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
sha256sums=('d6fb477a90b868c6e6ce3ec2a58ed8d07968b4b3eab8ac6c53ba57e6dcaca468')
#validpgpkeys=('85F86E317555BECC1C2184BF2C45BA09ABC5D7DA')

package() {
  unzip $srcdir/krr-ubuntu-latest-v$pkgver.zip -d $pkgdir/opt/
  mkdir -p $pkgdir/usr/local/bin
  ln -s $pkgdir/opt/krr/krr $pkgdir/usr/local/bin/krr
}
