# Maintainer: intothegnu <intothegnu@protonmail.com>

pkgname="neopassmenu"
pkgver="1.6.0"
pkgrel="1"
pkgdesc="Dmenu front end in POSIX shell for pass with, OTP, navigation, selection from multi-line files, and support for dmenu equivalents"
arch=('any')
depends=('pass' 'dmenu')
optdepends=('xclip: clipboard automation (X11)' 'wl-clipboard: clipboard automation (Wayland)' 'xdotool: simulate keypresses (X11)' 'ydotool: simulate keypresses (Wayland)' 'pass-otp: OTP support' 'sharutils: generate passwords')
license=('BSD')

url="https://codeberg.org/intothegnu/neopassmenu"

source=("https://codeberg.org/intothegnu/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('3eccb4e67e708f7fb127fc489be67bcf')

package(){
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/licenses/neopassmenu"
	mkdir -p "${pkgdir}/usr/share/man/man1"
	cd "${srcdir}/$pkgname" || exit 1
	make DESTDIR="${pkgdir}" prefix=/usr install
}
