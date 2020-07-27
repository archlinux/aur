## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=libgmpris
_debpkgver=2.2.1-7
pkgver=2.2.1
pkgrel=5
_pkgrel_x86_64=5
_pkgrel_aarch64=5
pkgdesc=" GMPRIS GDBus bindings
 GDBus bindings generated from the GMPRIS XML spec files."
arch=('x86_64' 'aarch64')
url="http://www.sonarnerd.net"
license=('LGPL')
depends=('glibc' 'glib2')
source_x86_64=("http://www.sonarnerd.net/src/buster/libgmpris_"$_debpkgver"_amd64.deb")
source_aarch64=("http://www.sonarnerd.net/src/buster/libgmpris_"$_debpkgver"_arm64.deb")
sha256sums_x86_64=('c26fdaba58de16b1997c5cc198ef644c1cd8014bdf61afae3cebf6020e63c921')
sha256sums_aarch64=('bf46ff40aec2cd00fcdfc74363c19f30e497405099764ddd867b50f499e7ceb6')

package() {
 cd "$srcdir"
 bsdtar xf data.tar.xz -C "$srcdir"
 install -Dm755 $srcdir/usr/lib/x86_64-linux-gnu/libgmpris.so.0.0.0 $pkgdir/usr/lib/libgmpris.so.0.0.0
 ln -s $pkgdir/usr/lib/libgmpris.so.0.0.0 $pkgdir/usr/lib/libgmpris.so.0
 install -Dm644 $srcdir/usr/share/doc/libgmpris/AUTHORS $pkgdir/usr/share/doc/$pkgname/AUTHORS
 install -Dm644 $srcdir/usr/share/doc/libgmpris/README $pkgdir/usr/share/doc/$pkgname/README
 install -Dm644 $srcdir/usr/share/doc/libgmpris/copyright $pkgdir/usr/share/licenses/$pkgname/COPYING
}
