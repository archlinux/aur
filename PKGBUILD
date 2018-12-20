# Maintainer: Mitchell Renouf <mitchellarenouf@gmail.com>

pkgbase=snapd-glib
pkgname=snapd-glib
pkgdesc="Library to allow GLib/Qt based applications access to snapd, the daemon that controls Snaps"
depends=( 'libsoup' 'json-glib')
pkgver=1.45
_pkgver=1.45-1
pkgrel=1
arch=('x86_64')
url="https://launchpad.net/snapd-glib"
license=('GPL3')
makedepends=('libsoup' 'json-glib' 'qt5-declarative' 'qt5-base' 'glib2' 'gtk-doc' 'autoconf' 'pkg-config' 'automake' 'libtool')
conflicts=($pkgbase)
options=('!strip' 'emptydirs')
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/snapd-glib/$_pkgver/snapd-glib_$pkgver.orig.tar.xz")
sha256sums=('aa204e17490f422375e6eb6a9d3d07f232931b89355a17cf70c4e42f8c155bb6')

provides=($pkgbase)

build() {
  cd "$pkgbase-$pkgver"
 ./configure --disable-silent-rules --enable-gtk-doc --prefix=/usr
  make -j1
}

package_snapd-glib() {
  cd "$pkgbase-$pkgver"
  make install -j1 DESTDIR="$pkgdir"
}

