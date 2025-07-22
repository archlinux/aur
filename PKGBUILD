# Maintainer: intothegnu <intothegnu@protonmail.com>

pkgname="neopassmenu"
pkgver="1.5.1"
pkgrel="1"
pkgdesc="Dmenu front end in POSIX shell for pass with, OTP, navigation, selection from multi-line files, and support for dmenu equivalents"
arch=('any')
depends=('pass' 'dmenu')
optdepends=('xclip: clipboard automation (X11)' 'wl-clipboard: clipboard automation (Wayland)' 'xdotool: simulate keypresses (X11)' 'ydotool: simulate keypresses (Wayland)' 'pass-otp: OTP support' 'sharutils: generate passwords')
license=('BSD')

url="https://notabug.org/BezierQuadratic/neopassmenu"

source=("https://notabug.org/BezierQuadratic/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('cea981206294cba42bd00e71633e516d')

package(){
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/licenses/neopassmenu"
	mkdir -p "${pkgdir}/usr/share/man/man1"
	gzip "${srcdir}/neopassmenu/docs/neopassmenu.1"
	install -m 755 "${srcdir}/neopassmenu/neopassmenu.sh" "${pkgdir}/usr/bin/neopassmenu"
	install -m 644 "${srcdir}/neopassmenu/LICENSE" "${pkgdir}/usr/share/licenses/neopassmenu/LICENSE"
	install -m 644 "${srcdir}/neopassmenu/docs/neopassmenu.1.gz" "${pkgdir}/usr/share/man/man1/neopassmenu.1.gz"
}
