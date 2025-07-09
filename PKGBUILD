# Maintainer: Nikita Tarasov <nikatar@disroot.org>
pkgname=krr
pkgver=1.24.0
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
sha256sums=('413985503775c12069d8da1a657f4b77a073426b8e50d2ffea451cdf25c52558')
#validpgpkeys=('85F86E317555BECC1C2184BF2C45BA09ABC5D7DA')

package() {
  unzip $srcdir/krr-ubuntu-latest-v$pkgver.zip -d $pkgdir/opt/
  mkdir -p $pkgdir/usr/local/bin
  ln -s $pkgdir/opt/krr/krr $pkgdir/usr/local/bin/krr
}
