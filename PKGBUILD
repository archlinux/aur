# Maintainer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

pkgname=waydroid
pkgver=1.4.1
pkgrel=1
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system"
arch=('any')
url='https://waydro.id/'
license=('GPL')
depends=('lxc' 'python-gbinder' 'python-gobject' 'nftables' 'dnsmasq' 'gtk3' 'dbus-python')
makedepends=('git')
optdepends=('python-pyclip: share clipboard with container')
_commit="7ce2e28e8ea76c1e79b273d122921c1f394e842f" # tags/1.4.1
source=("waydroid::git+https://github.com/waydroid/waydroid.git#commit=$_commit")

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

package() {
  make -C waydroid install DESTDIR="$pkgdir" USE_NFTABLES=1
}

sha256sums=('SKIP')
