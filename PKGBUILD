# Maintainer : Xylemon <xylemon@vera-visions.com>

pkgname=fteqw-sv
pkgver=20250927
gitver=2025-09-27
pkgrel=1
pkgdesc="FTE QuakeWorld Dedicated and Master Server, idTech engine for Quake 1,2,3 and Hexen 2"
arch=('i686' 'x86_64')
url="https://fteqw.org"
license=('GPL-2.0-or-later')
makedepends=('make' 'gcc')
depends=('libpng' 'zlib' 'freetype2' 'libjpeg-turbo' 'libxkbcommon' 'speex' 'opus' 'libogg' 'libpng' 'libvorbis')
conflicts=('ftequake-sv-svn' 'ftequake-sv-git' 'fteqw-sv-svn' 'fteqw-sv-git')
provides=('ftequake-sv')
source=("https://github.com/fte-team/fteqw/archive/$gitver.tar.gz")
sha512sums=('cf76a900ba933928ae40ed25a2cb178f1b4ce0a2f646b421d2022dd889473654f5c647589d492846b76e361a218a94a11f7e3d5504fcdc4b01a4de4b76b26187')
build() {

	cd "$srcdir/fteqw-$gitver/engine"

	make sv-rel
	make master-rel

}

package() {
 
	cd "$srcdir/fteqw-$gitver/engine/release"

	install -Dm755 fteqw-sv "$pkgdir"/usr/bin/fteqw-sv
	install -Dm755 ftemaster "$pkgdir"/usr/bin/ftemaster

}

