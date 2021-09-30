# Maintainer: koraynilay <koray.fra@gmail.com>
pkgname=scrnsvr-bin
pkgver=1.19
pkgrel=1
pkgdesc="Yet Another X Screensaver/locker. Precompiled version."
arch=('x86_64')
url="https://github.com/koraynilay/scrnsvr"
license=('WTFPL')
depends=('libxss' 'pcre' 'libdbus' 'python')
makedepends=('git' 'gcc')
conflicts=('scrnsvr')
source=("$pkgname-$pkgver::git+https://github.com/koraynilay/scrnsvr")
optdepends=('dunst: dunstify for notifications' 'libnotify: for notifications' 'libxinerama: for multi-monitor with xinerama fullscreen check support' 'libxrandr: for multi-monitor with xrandr fullscreen check support')
install="scrnsvr.install"
md5sums=("SKIP")

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm0755 bin/scrnsvr "$pkgdir/usr/bin/${pkgname::-4}"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/scrnsvr/LICENSE"
	install -Dm0644 RETURN_CODES.txt "$pkgdir/usr/share/scrnsvr/RETURN_CODES.txt"
	install -Dm0644 scrnsvr.ini.example "$pkgdir/usr/share/scrnsvr/scrnsvr.ini.example"
	#install -Dm0644 scrnsvr.service "$pkgdir/usr/lib/systemd/user/scrnsvr.service"
}
