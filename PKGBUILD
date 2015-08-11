# Maintainer: shimi <shimi.chen@gmail.com>
# Contributor: Marios Abatis <marios.archlinux αt gmail δοτ com>

pkgname=bodr
pkgver=10
pkgrel=1
pkgdesc="A set of data for chemoinformatics in both XML and plain-text formats."
arch=('i686' 'x86_64')
url="http://sf.net/projects/bodr/"
license=('MIT')
makedepends=('autoconf' 'automake' 'perl')
source=(http://downloads.sourceforge.net/bodr/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('16ea340e3d7fd236b28c2e23f2696ed8')

build() {
	cd ${srcdir}/$pkgname-$pkgver

	./configure --prefix=/usr
	make || return 1
}

package() {
	cd ${srcdir}/$pkgname-$pkgver

	make prefix=${pkgdir}/usr install || return 1
	mkdir -p ${pkgdir}/usr/share/licenses/$pkgname #Store the MIT license according to the Arch Packaging Standards
	cp ${pkgdir}/usr/share/doc/$pkgname/COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING
  
}
