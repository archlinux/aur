# Maintainer: Talon <talon at wettstein dot qzz dot io>

pkgname=tinyfiledialogs
pkgver=3.21.3
pkgrel=1
pkgdesc='tiny file dialogs: a cross platform (C, C++) file dialog opener'
arch=(x86_64)
url='http://tinyfiledialogs.sourceforge.net'
options=(!strip staticlibs)
license=('Zlib')
optdepends=('applescript' 'kdialog' 'zenity' 'matedialog' 'shellemantary' 'qarma' 'shanty' 'boxer' 'yad')
_pkgsrc="$pkgname"
source=("$_pkgsrc.zip" 'LICENSE')
sha256sums=('a39627520b644df8f65a71394a6d5ddeb8ab6e413b254822aee750457d5e51c6'
            '4d9237e943cff030cdce71622c6f8b74cd06e2b30b7e5339b394a586d6d0bc7e')


build() {
	cd "$_pkgsrc"
	
	cc -c tinyfiledialogs.c -o tinyfiledialogs.o -O2
	ar rcs libtinyfiledialogs.a tinyfiledialogs.o
}

package() {
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

	cd "$_pkgsrc"
	install -Dm644 libtinyfiledialogs.a -t "${pkgdir}/usr/lib"
	install -Dm644 tinyfiledialogs.h -t "${pkgdir}/usr/include"
}
