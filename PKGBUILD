# Maintainer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

pkgname=waydroid
pkgver=1.5.2
pkgrel=1
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system"
arch=('any')
url='https://waydro.id/'
license=('GPL-3.0-or-later')
depends=('lxc' 'python-gbinder' 'python-gobject' 'nftables' 'dnsmasq' 'gtk3' 'dbus-python')
makedepends=('git')
_commit="ae1011665200a9c69a34ca84826fdad4089aff5d" # tags/1.5.2
source=("waydroid::git+https://github.com/waydroid/waydroid.git#commit=$_commit")

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

package() {
  make -C waydroid install DESTDIR="$pkgdir" USE_NFTABLES=1
}

sha256sums=('42f5f406e5de15d5e4934689579d9afc5beb180b8d883dd6140a08d27ed52c69')
