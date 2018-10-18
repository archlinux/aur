# Maintainer: Mitchell Renouf <mitchellarenouf@gmail.com>

pkgbase=snapd-glib
pkgname=snapd-glib
pkgdesc="Library to allow GLib/Qt based applications access to snapd, the daemon that controls Snaps"
depends=( 'libsoup' 'json-glib')
pkgver=1.44
_pkgver=1.44-1
pkgrel=1
arch=('x86_64')
url="https://launchpad.net/snapd-glib"
license=('GPL3')
makedepends=('git'  'libsoup' 'json-glib' 'qt5-declarative' 'qt5-base' 'glib2' 'gtk-doc' 'autoconf' 'pkg-config' 'automake' 'libtool')
conflicts=($pkgbase)
options=('!strip' 'emptydirs')
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/snapd-glib/$_pkgver/snapd-glib_$pkgver.orig.tar.xz")
sha256sums=('071b31824afe82ba783d02484d4a6abc0c6d2107b1c71323f618363766ee1521')
validpgpkeys=('497851B5D455C606543F2B9318EAA1890F7C882E')

provides=($pkgbase)

build() {
  cd "$pkgbase-$pkgver"
 ./configure --disable-silent-rules --enable-gtk-doc --prefix=/usr
  make $MAKEFLAGS
}

package_snapd-glib() {
  cd "$pkgbase-$pkgver"
  make install DESTDIR="$pkgdir"
}

