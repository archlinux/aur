# Contributor: Yamashita Ren
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>

pkgname=peazip-qt-opensuse
pkgver=6.0.0
_rpmrel=1.1
pkgrel=2
pkgdesc="QT archiver utility (openSUSE x86_64 RPM)"
arch=(x86_64)
url=http://peazip.sourceforge.net/peazip-linux.html
license=(Artistic2.0 LGPL2.1)
depends=(balz desktop-file-utils curl gmp4 libx11 ncurses qt4pas p7zip upx)
optdepends=(quad unace unrar zpaq)
provides=(${pkgname%-*-*})
conflicts=(${pkgname%-*-*} ${pkgname%-*-*}-gtk2 ${pkgname%-*})
source=(http://download.opensuse.org/repositories/devel:/languages:/pascal/openSUSE_Factory/x86_64/${pkgname%-*-*}-${pkgver}-${_rpmrel}.x86_64.rpm)
sha256sums=('7e2ac057678fb6386c427c978de83f70689d02769ab2501e80cd1bb0c317bff3')

prepare() {
	rm -R "$srcdir/usr/share/doc"
	chmod go-w "$srcdir"/usr/bin/*
}

package() {
	cp -R "$srcdir"/usr $pkgdir/
}
