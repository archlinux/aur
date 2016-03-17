# Contributor: Yamashita Ren
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>

pkgname=peazip-qt-opensuse
pkgver=6.0.0
_rpmrel=1.1
pkgrel=1
pkgdesc="QT archiver utility (openSUSE x86_64 RPM)"
arch=(x86_64)
url=http://peazip.sourceforge.net/peazip-linux.html
license=(Artistic2.0 LGPL2.1)
depends=(balz desktop-file-utils curl gmp4 libx11 ncurses qt4pas p7zip upx)
optdepends=(quad unace unrar zpaq)
provides=(${pkgname%-*-*})
conflicts=(${pkgname%-*-*}-gtk2 ${pkgname%-*})
source=(http://download.opensuse.org/repositories/devel:/languages:/pascal/openSUSE_Factory/x86_64/${pkgname%-*-*}-${pkgver}-${_rpmrel}.x86_64.rpm)
sha256sums=('a658e9c77937d315e5f05eccd5fa5ae1edc850cf86b476177f5791e702cc8d1d')

prepare() {
	rm -R "$srcdir/usr/share/doc"
	chmod go-w "$srcdir"/usr/bin/*
}

package() {
	cp -R "$srcdir"/usr $pkgdir/
}
