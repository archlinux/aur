# Maintainer: Nick Østergaard <oe.nick at gmail dot com>

pkgname=slic3r
pkgver=0.9.1
pkgrel=1
pkgdesc="Slic3r is an STL-to-GCODE translator for RepRap 3D printers, aiming to be a modern and fast alternative to Skeinforge."
arch=('any')
url="http://slic3r.org/"
license=('GPL')
depends=('perl' 'perl-moo' 'perl-moo' 'perl-boost-geometry-utils' 'perl-math-clipper' 'perl-math-convexhull' 'perl-math-geometry-voronoi' 'perl-math-planepath')
makedepends=('git')
optdepends=('perl-wx: gui support'
            'perl-growl-gntp: notifcations support'
            'perl-net-dbus: ???'
            'perl-xml-sax: ???')
provides=('slic3r')
conflicts=('slic3r-git')
source=('http://dl.slic3r.org/linux/slic3r-linux-x86_64-0-9-1.tar.gz'
				'slic3r.desktop')
md5sums=('1f18badd44021ad19e2fec775f818c86'
         '80b52d89fe5d15ebe0c6aa2fe40fe9b5')

build() {
	install -d "$pkgdir/opt/$pkgname"
  cp -r $srcdir/Slic3r/* $pkgdir/opt/$pkgname
	install -d "$pkgdir/usr/share/applications"
  install -m 644 "$srcdir/slic3r.desktop" "$pkgdir/usr/share/applications/"
	install -d "$pkgdir/usr/bin"
	ln -sf "$pkgdir/opt/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
