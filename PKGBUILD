# Maintainer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

pkgname=waydroid
pkgver=1.4.3
pkgrel=1
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system"
arch=('any')
url='https://waydro.id/'
license=('GPL')
depends=('lxc' 'python-gbinder' 'python-gobject' 'nftables' 'dnsmasq' 'gtk3' 'dbus-python')
makedepends=('git')
optdepends=('python-pyclip: share clipboard with container')
_commit="9cd66662ba53d491ce7e3c74218b5194267a6f68" # tags/1.4.3
source=("waydroid::git+https://github.com/waydroid/waydroid.git#commit=$_commit")

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

package() {
  make -C waydroid install DESTDIR="$pkgdir" USE_NFTABLES=1
}

sha256sums=('e240941d48afa39a8a434dd9ed472280909c34eb639d67883c8d8808a62e568c')
