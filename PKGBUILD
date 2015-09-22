# Maintainer: zaps166 <spaz16 at wp dot pl>

pkgname=mate-calc-git
pkgver=1.8.0
pkgrel=2
pkgdesc='Calculator for the Mate desktop environment'
arch=('i686' 'x86_64')
url='https://github.com/mate-desktop/mate-calc'
license=('GPL')
groups=('mate-extra')
depends=('mate-common')
makedepends=('make' 'gcc' 'autoconf' 'intltool' 'pkg-config')
provides=('mate-calc')
source=("git+https://github.com/mate-desktop/mate-calc#branch=fixes")
sha1sums=(SKIP)
install=$pkgname.install

build()
{
	cd mate-calc
	sh autogen.sh --prefix=/usr
	make
}

package()
{
	cd mate-calc
	make DESTDIR="${pkgdir}" install
}
