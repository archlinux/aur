# Maintainer: Adrien Sohier <adrien.sohier@art-software.fr>
pkgname=ltunify-git
pkgver=0.2.22.gc3a263f
pkgrel=1
pkgdesc="A command-line tool to pair Logitech Unifying devices"
arch=('i686' 'x86_64' 'ARM')
url="http://lekensteyn.nl"
license=('GPL')
depends=('glibc')
makedepends=('git')
source=('git+https://git.lekensteyn.nl/ltunify.git')
md5sums=('SKIP')
changelog='NEWS'
_gitname='ltunify'

pkgver() {
	cd "$_gitname"
	git describe --always | sed 's|^v||;s|-|.|g'
}

build() {
	cd "$_gitname"
	make ltunify
}

package() {
	cd "$_gitname"
	make install DESTDIR=$pkgdir bindir=/usr/bin udevrulesdir=/usr/lib/udev/rules.d
}
