# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>
# Contributor: kappa <kappacurve at gmail dot com>

pkgname=gimp-plugin-normalmap
_srcname=gimp-normalmap
pkgver=1.2.3
pkgrel=2
pkgdesc='A plugin for GIMP that aids in the authoring of tangent-space normal maps for use in per-pixel lighting applications.'
url="https://code.google.com/archive/p/$_srcname/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gimp' 'gtkglext' 'glew')
conflicts=('gimp-normalmap')
replaces=('gimp-normalmap')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/$_srcname/$_srcname-$pkgver.tar.bz2")
sha512sums=('08320f0da06b9c11f3a57e8d4fc680699c90f6d17f3becf5adc924577117521d9311694aeafc15161e799d117a6c16edf4fad3691468ee5c43553093fc008ae6')
options=(!strip)

build() {
  cd "$srcdir/$_srcname-$pkgver"
  make LDFLAGS=-lm
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  install -D -m 755 ./normalmap $pkgdir/usr/lib/gimp/2.0/plug-ins/normalmap
}
