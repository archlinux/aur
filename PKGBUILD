# Maintainer : E5ten <e5ten.arch@gmail.com>
# Contributor : Shawn Dellysse sdellysse@gmail.com

pkgname=parsec-bin
pkgver=146_18
pkgrel=4
pkgdesc="Remotely connect to a gaming pc for a low latency remote computing experience"
url=http://parsec.tv
arch=('x86_64')
provides=('parsec')
conflicts=('parsec')
depends=('gtk2' 'libsm' 'gcc-libs' 'libglvnd' 'mesa<=18.0.4')
optdepends=('libva: For hardware accelerated decoding')
source=("https://s3.amazonaws.com/parsec-build/package/parsec-linux.deb")
md5sums=('606463260d9ae1efe727457ea1009b4d')
package() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps
	mkdir -p $pkgdir/usr/share/applications
	bsdtar xf $srcdir/data.tar.xz
	install -Dm755 $srcdir/usr/bin/parsecd $pkgdir/usr/bin/
	install -Dm755 $srcdir/usr/share/applications/parsec.desktop $pkgdir/usr/share/applications/
	install -Dm644 $srcdir/usr/share/icons/hicolor/256x256/apps/parsec.png $pkgdir/usr/share/icons/hicolor/256x256/apps/
	ln -s /usr/bin/parsecd $pkgdir/usr/bin/parsec
}

