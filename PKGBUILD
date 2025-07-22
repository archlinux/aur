# Maintainer: ifurther <>
# Contributor: Aaronjamt 
pkgname=ufw-docker
pkgver=250710
pkgrel=1
pkgdesc="To fix the Docker and UFW security flaw without disabling iptables."
arch=("any")
url="https://github.com/chaifeng/${pkgname}"
license=('GPL License Version 3.0')
depends=('ufw')
install=ufw-docker.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/chaifeng/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        "ufw-docker.install")
sha256sums=('13b17fc74df2fdb6bda653c6130054f156318a4910db4c943be1df54110a450b'
            'd97ba0e63766444128e4ddfadc316734f431b5d6d9fc6a6ddadbfd1057ae95f7')

package() {
  pushd "$srcdir/$pkgname-$pkgver"
  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/ufw-docker/LICENSE"

  msg2 'Installing...'
  install -Dm755 ufw-docker "$pkgdir/usr/bin/ufw-docker"

}
