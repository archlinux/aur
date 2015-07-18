# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: imp0se <undefinedfunc@gmail.com>
pkgname=archey-plus
pkgver=0.2.8
pkgrel=1
pkgdesc="Based on Archey 0.2.8, adding support for Manjaro, Cinnamon dm/me, and bug fixes"

arch=('any')
url="https://github.com/imp0se/archey-plus"
license=('GPL')
depends=('python2' 'lsb-release' 'scrot')
makedepends=('git')
conflicts=('archey' 'archey2')
provides=('archey')
source=("git://github.com/imp0se/archey-plus.git")
md5sums=('SKIP')

#pkgver() {
#	cd ${pkgname}
#	git describe --always | sed 's|-|.|g'
#}

package() {
	#cd ${srcdir}
	#rm -rf archey
	#msg "Connecting to GIT server...."

	#if [ -d archey ] ; then
	#	cd archey && git pull origin
	#	msg "The local files are updated."
	#else
	#	git clone ${source}
	#fi

	#msg "GIT checkout done or server timeout"
	#msg "Starting make..."

	#cd ${srcdir}/archey

	cd "$srcdir/$pkgname"
	install -D -m644 COPYING ${pkgdir}/usr/share/licenses/archey-plus/COPYING
	install -D -m755 archey ${pkgdir}/usr/bin/archey || return 1
}