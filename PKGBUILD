# Contributor: Yamashita Ren
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>

pkgname=peazip-qt-opensuse
pkgver=5.9.1
pkgrel=1.2
pkgdesc="QT archiver utility (openSUSE RPM)"
arch=(x86_64)
url=http://peazip.sourceforge.net/peazip-linux.html
license=(Artistic2.0 LGPL2.1)
depends=(balz desktop-file-utils curl gmp4 libx11 ncurses qt4pas p7zip upx)
optdepends=(quad unace zpaq)
provides=(${pkgname%-*-*})
conflicts=(${pkgname%-*-*}-gtk2 ${pkgname%-*})
source=(http://download.opensuse.org/repositories/home:/X0F:/HSF/openSUSE_Tumbleweed/${CARCH}/${pkgname%-*-*}-${pkgver}-${pkgrel}.${CARCH}.rpm)
sha256sums=('bbf6d23d2c2d5dbff27c24cb76f6ad18f0f4ccae95cb5453c090f3aa571e2661')

prepare() {
	rm -R "$srcdir/usr/share/doc"
	chmod go-w "$srcdir"/usr/bin/*
}

package() {
	cp -R "$srcdir"/usr $pkgdir/
}
