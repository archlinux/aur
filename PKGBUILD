# Maintainer: ifurther <>

pkgname=ufw-docker
pkgver=210925
pkgrel=1
pkgdesc="To fix the Docker and UFW security flaw without disabling iptables."
arch=("any")
url="https://github.com/chaifeng/${pkgname}"
license=('GPL License Version 3.0')
depends=('ufw')
install=ufw-docker.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/chaifeng/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        "ufw-docker.install")
sha256sums=('805d65ad952364e888294515c0a127a6d46a9628af87311f2bb7a8b57935121c'
            'd97ba0e63766444128e4ddfadc316734f431b5d6d9fc6a6ddadbfd1057ae95f7')

package() {
  pushd "$srcdir/$pkgname-$pkgver"
  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/ufw-docker/LICENSE"

  msg2 'Installing...'
  install -Dm755 ufw-docker "$pkgdir/usr/bin/ufw-docker"

}
