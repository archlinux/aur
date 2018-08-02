# Maintainer : E5ten <e5ten.arch@gmail.com>
# Contributor : Shawn Dellysse sdellysse@gmail.com

pkgname=parsec-bin
pkgver=147_6
pkgrel=7
pkgdesc="Remotely connect to a gaming pc for a low latency remote computing experience"
url=http://parsec.tv
arch=('x86_64')
epoch=1
provides=('parsec')
conflicts=('parsec')
depends=('gtk2' 'libsm' 'gcc-libs' 'libglvnd' 'mesa')
optdepends=('libva: For hardware accelerated decoding')
source=("https://s3.amazonaws.com/parsec-build/package/parsec-linux.deb")
md5sums=('9f9e2eda656f49ce354e5c9407b8467a')
package() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps
	mkdir -p $pkgdir/usr/share/applications
	mkdir -p $pkgdir/usr/share/parsec/skel
	bsdtar xf $srcdir/data.tar.xz
	install -Dm755 $srcdir/usr/bin/parsecd $pkgdir/usr/bin/
	install -Dm755 $srcdir/usr/share/applications/parsec.desktop $pkgdir/usr/share/applications/
	install -Dm644 $srcdir/usr/share/icons/hicolor/256x256/apps/parsec.png $pkgdir/usr/share/icons/hicolor/256x256/apps/
	ln -s /usr/bin/parsecd $pkgdir/usr/bin/parsec
	cp $srcdir/usr/share/parsec/skel/appdata.json $pkgdir/usr/share/parsec/skel/appdata.json
	cp $srcdir/usr/share/parsec/skel/parsecd-147-6.so $pkgdir/usr/share/parsec/skel/parsecd-147-6.so
}

