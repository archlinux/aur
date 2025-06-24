# Maintainer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

pkgname=waydroid
pkgver=1.5.4
pkgrel=1
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system"
arch=('any')
url='https://waydro.id/'
license=('GPL-3.0-or-later')
depends=('lxc' 'python-gbinder' 'python-gobject' 'nftables' 'dnsmasq' 'gtk3' 'dbus-python')
makedepends=('git')
_commit="661934e2faea119f8fa9f9d00a0a4970e4864123" # tags/1.5.4
source=("waydroid::git+https://github.com/waydroid/waydroid.git#commit=$_commit")

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

package() {
  make -C waydroid install DESTDIR="$pkgdir" USE_NFTABLES=1
}

sha256sums=('ad970f973815eb38647f13bc112fa139aa0e1e7e254413d8adc0f68b63428497')
