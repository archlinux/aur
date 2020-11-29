# Maintainer: librewish <librewish at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jay Garcia <morbidj at gmail dot com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Robert Orzanna <orschiro at gmail dot com>
pkgname=timeshift
pkgver=20.11.1
pkgrel=1
pkgdesc="A system restore utility for Linux"
arch=('i686' 'x86_64')
url="https://github.com/teejee2008/timeshift"
license=('GPL')
depends=('gtk3' 'libsoup' 'desktop-file-utils' 'cronie' 'rsync' 'libgee' 'vte3'
         'xapp' 'xorg-xhost' 'btrfs-progs')
makedepends=('vala' 'diffutils' 'coreutils') #'xapp=1.8.10')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c6dcca80b42f80a8c8d9d03e91eb17aa634be2f1031f667bba3f483410297abb')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
