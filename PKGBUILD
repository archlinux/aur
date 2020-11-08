# Maintainer: librewish <librewish at gmail dot com>
_pkgname="simple-nfs-gui"
pkgname="$_pkgname-bin"
pkgver="1.0.17"
pkgrel=1
pkgdesc="Simple NFS GUI for Linux"
arch=('x86_64')
url="https://github.com/Philippe734/Simple.NFS.GUI"
license=('GPL')
depends=('gambas3-runtime' 'gambas3-runtime' 'gambas3-gb-form' 'gambas3-gb-form' 'gambas3-gb-image' 'gambas3-gb-image' 'gambas3-gb-qt5' 'gambas3-gb-qt5' 'lxqt-sudo')
provides=(simple-nfs-gui)
conflicts=(simple-nfs-gui)
source=("https://github.com/Philippe734/Simple.NFS.GUI/raw/master/Linux/1.0.17/simple-nfs-gui_1.0.17-0ubuntu1_all.deb"
"simple-nfs-gui.desktop")
noextract=("$_pkgname_$pkgver-0ubuntu1_all.deb")
md5sums=('5b402603b493b9309b0da28d92f5f5ae'
         '0fd3324d74f18ea329d30c6e4fe60f83')

prepare() {
	# extract data.tar.xz from the .deb file
	ar p simple-nfs-gui_$pkgver-0ubuntu1_all.deb data.tar.xz | tar x -J
}

package() {
	# move extracted files to pkgdir
	mv $srcdir/usr $pkgdir/usr
    cp $srcdir/simple-nfs-gui.desktop $pkgdir/usr/share/applications/simple-nfs-gui.desktop
}
