# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tom K <tom@archlinux.org>

pkgname=linuxdcpp
pkgver=1.1.0
pkgrel=7
pkgdesc="A Gtk+ Direct Connect client based on DC++."
url="https://launchpad.net/linuxdcpp/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('openssl' 'glib2' 'libglade' 'bzip2' 'libnotify' 'hicolor-icon-theme')
makedepends=('scons' 'boost')
conflicts=('linuxdcpp-bzr')
source=("$url${pkgver%%.?}/$pkgver/+download/$pkgname-$pkgver.tar.bz2")
md5sums=('037de708bdb1e5dd7ac6c359b0e2c1a0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  scons PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  scons install FAKE_ROOT="$pkgdir/"
}
