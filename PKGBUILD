# Maintainer: zaps166 <spaz16 at wp dot pl>

pkgname=mate-calc-git
pkgver=1.8.0
pkgrel=4
pkgdesc='Calculator for the Mate desktop environment'
arch=('i686' 'x86_64')
url='https://github.com/mate-desktop/mate-calc'
license=('GPL')
groups=('mate-extra')
makedepends=('make' 'gcc' 'autoconf' 'intltool' 'pkg-config' 'mate-common')
provides=('mate-calc')
source=("git+https://github.com/mate-desktop/mate-calc#branch=fixes" "org.mate.calc.gschema.xml.in.patch")
sha1sums=('SKIP' 'e3cae557dee7c339236bdd7fff43a81e00d5b4d8')
install=$pkgname.install

build()
{
	cd mate-calc
	patch -p1 < ../org.mate.calc.gschema.xml.in.patch
	sh autogen.sh --prefix=/usr
	make
}

package()
{
	cd mate-calc
	make DESTDIR="${pkgdir}" install
}
