# Maintainer: Kyle Terrien <kyleterrien@gmail.com>
# Contributor: Leandro Pincini <redpill@archlinux-br.org>
pkgname=gtk-bluecurve-engine-fc
pkgver=1.0.0
pkgrel=2
pkgdesc="Bluecurve GTK+ engine from Fedora"
md5sums=('5eb884cbe86e40e52127222400477f03')
source=("http://pkgs.fedoraproject.org/repo/pkgs/bluecurve-gtk-themes/bluecurve-gtk-themes-${pkgver}.tar.bz2/${md5sums[0]}/bluecurve-gtk-themes-${pkgver}.tar.bz2")
url="https://fedoraproject.org/wiki/Design"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gtk2')
conflicts=('gtk-bluecurve-engine')
provides=('gtk-bluecurve-engine')

# This is the version of Bluecurve that Fedora 23 packages.
# There are a few nice variants and what appears to be small fixes
# for e.g. right-to-left text.

build() {
	cd ${srcdir}/bluecurve-gtk-themes-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/bluecurve-gtk-themes-${pkgver}
	make prefix=${pkgdir}/usr install
}

# vim: noet ts=4 sw=4 :
