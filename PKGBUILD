# Maintainer: Nathaniel Maia <natemaia10@gmail.com>
# Contributor: Eric Vidal <eric@obarun.org>

pkgname=kickshaw
pkgver=0.5
pkgrel=2
pkgdesc='A menu editor for openbox'
url='https://github.com/natemaia/kickshaw'
arch=( 'x86_64' )
md5sums=('SKIP')
license=( 'GPL2' )


source=("$url/raw/master/kickshaw_0.5_RC2_source_only.tar.bz2")
validpgpkeys=('6DD4217456569BA711566AC7F06E8FDE7B45DAAC') # Eric Vidal
depends=('gtk3' 'gcc')

build() {
	cd "kickshaw_0.5_RC2_source_only/source"
	make
}

package(){
	cd "kickshaw_0.5_RC2_source_only/source"
	install -Dm755 kickshaw "$pkgdir/usr/bin/kickshaw"
	install -Dm755 kickshaw.desktop "$pkgdir/usr/share/applications/kickshaw.desktop"

	# license , copying readme in license directory for provide author
	cd "../"
	install -Dm755 README "${pkgdir}/usr/share/licenses/kickshaw/README"
	install -Dm755 COPYING "${pkgdir}/usr/share/licenses/kickshaw/COPYING"
}
