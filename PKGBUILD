# Maintainer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

pkgname=waydroid
pkgver=1.5.0
pkgrel=1
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system"
arch=('any')
url='https://waydro.id/'
license=('GPL-3.0-or-later')
depends=('lxc' 'python-gbinder' 'python-gobject' 'nftables' 'dnsmasq' 'gtk3' 'dbus-python')
makedepends=('git')
optdepends=('python-pyclip: share clipboard with container')
_commit="61d5be43dc7b4ccb07f08179ec44a4acc838e94e" # tags/1.5.0
source=("waydroid::git+https://github.com/waydroid/waydroid.git#commit=$_commit")

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

package() {
  make -C waydroid install DESTDIR="$pkgdir" USE_NFTABLES=1
}

sha256sums=('f07b27f07918e537c55e652ca0dfd90094062fbd11b2dbe5fea5b5cd9143d3f2')
