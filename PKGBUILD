# Maintainer: Kyle Terrien <kyleterrien@gmail.com>
# Contributor: Leandro Pincini <redpill@archlinux-br.org>
pkgname=gtk-bluecurve-engine-fc
pkgver=1.0.0
pkgrel=1
pkgdesc="Bluecurve GTK+ engine from Fedora"
source=("http://pkgs.fedoraproject.org/repo/pkgs/bluecurve-gtk-themes/bluecurve-gtk-themes-1.0.0.tar.bz2/5eb884cbe86e40e52127222400477f03/bluecurve-gtk-themes-1.0.0.tar.bz2")
url="https://fedoraproject.org/wiki/Artwork"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gtk2')
conflicts=('gtk-bluecurve-engine')
provides=('gtk-bluecurve-engine')
sha256sums=('fc73dee6f1bb8fd52ed2cd031cf50062b7e8c422205200c4f83134692fbe6efb')

# This is the version of Bluecurve that Fedora 23 packages.
# There are a few nice variants and what appears to be small fixes
# for e.g. right-to-left text.

package() {
	cd ${srcdir}/bluecurve-gtk-themes-${pkgver}
	./configure --prefix=/usr
	make || return 1
	make prefix=${pkgdir}/usr install
}

# vim: noet ts=4 sw=4 :
