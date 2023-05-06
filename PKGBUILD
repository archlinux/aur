# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <youremail@domain.com>
pkgname=com.tencent.docs.deepin
pkgver=2.3.19
pkgrel=1
epoch=
pkgdesc="TencentDocs Client on Deepin Wine6"
arch=(x86_64)
url="https://docs.qq.com/"
license=('custom')
groups=()
depends=(libx11  bash  gtk2  xdg-utils  glib2  pango  glibc  cairo  fontconfig  freetype2
                 at-spi2-core  gdk-pixbuf2  lib32-glibc deepin-wine6-stable
		gnome-settings-daemon
		 )
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://com-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.docs.deepin/com.tencent.docs.deepin_${pkgver}deepin1_i386.deb)
noextract=()
sha256sums=('b52b7b166fb383bf8c5924249cd2c30158bd884e9400ae4f2fabf3a5e3ae6d0a')
validpgpkeys=()


package() {
	tar -xvpf data.tar.* -C $pkgdir
	gendesk --exec "/opt/apps/$pkgname/files/run.sh" --pkgname $pkgname
	install -Dm644 $pkgname.desktop -t $pkgdir/usr/share/applications/
	echo "===> run /usr/lib/gsd-xsettings before run the program"
	echo "run /opt/apps/com.tencent.docs.deepin/files/run.sh to launch, if desktop file failed"
}
