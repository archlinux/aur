# Maintainer: lerentis <lerentis+aur@uploadfilter24.eu>
# Ex-Maintainer:: Nikita Tarasov <nikatar@disroot.org>
pkgname=krr
pkgver=1.26.0
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
sha256sums=('0f191b698be3375b6382dc80111193144457948393bf3debce3f0c273223c9c4')
#validpgpkeys=('85F86E317555BECC1C2184BF2C45BA09ABC5D7DA')

package() {
  unzip $srcdir/krr-ubuntu-latest-v$pkgver.zip -d $pkgdir/opt/
  mkdir -p $pkgdir/usr/local/bin
  ln -s $pkgdir/opt/krr/krr $pkgdir/usr/local/bin/krr
}
