# Maintainer: Tony Lambiris <tony@libpcap.net>
pkgname=breeze-adapta-cursor-theme-git
_pkgname=Breeze-Adapta-Cursor
pkgver=r32.1d24541
pkgrel=1
pkgdesc="Popular Breeze Cursor modified for Adapta theme."
arch=('any')
url="https://github.com/mustafaozhan/Breeze-Adapta-Cursor"
license=('GPL')
#source=("https://github.com/mustafaozhan/Breeze-Adapta-Cursor/archive/master.zip")
source=("git+https://github.com/mustafaozhan/Breeze-Adapta-Cursor")
makedepends=('unzip')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    #cd $srcdir/Breeze-Adapta-Cursor-master
	cd "${srcdir}/${_pkgname}"
    install -d $pkgdir/usr/share/icons/Breeze-Adapta-Cursor
    cp -rf *   $pkgdir/usr/share/icons/Breeze-Adapta-Cursor
    chmod -R 644 $pkgdir/usr/share/icons/Breeze-Adapta-Cursor/*
    chmod 755 $pkgdir/usr/share/icons/Breeze-Adapta-Cursor
    chmod 755 $pkgdir/usr/share/icons/Breeze-Adapta-Cursor/cursors
}
