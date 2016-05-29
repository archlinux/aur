# Maintainer: zaps166 <spaz16 at wp dot pl>

pkgname=mucharmap-git
pkgver=1.6.0
pkgrel=2
pkgdesc='Mate Unicode Charmap'
arch=('i686' 'x86_64')
url='https://github.com/mate-desktop/mate-character-map'
license=('GPL')
groups=('mate-extra')
makedepends=('make' 'gcc' 'autoconf' 'intltool' 'pkg-config' 'mate-common')
provides=('mate-calc')
source=("git+https://github.com/mate-desktop/mate-character-map")
sha1sums=(SKIP)
install=$pkgname.install

build()
{
	cd mate-character-map
	sh autogen.sh --prefix=/usr
	make
}

package()
{
	cd mate-character-map
	make DESTDIR="${pkgdir}" install
}
