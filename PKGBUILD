# Maintainer: <grawity@gmail.com>
pkgname=ectpping
pkgver=0.2
pkgrel=1
pkgdesc="'ping' type utilty for the Ethernet V2.0 Configuration Testing Protocol"
arch=(i686 x86_64)
url="http://developer.berlios.de/projects/ectpping/"
license=('GPL2')
source=("http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=(60634ee17f9a07691bb0b1ad2fa3ed92)

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm4755 "ectpping" "$pkgdir/usr/sbin/ectpping"
  # recommended, but requires building w/o fakeroot,
  # also not supported by .tar format
  # should be moved to $install?
  #setcap cap_net_raw=ep "$pkgdir/usr/sbin/ectpping"
}

# vim:set ts=2 sw=2 et:
