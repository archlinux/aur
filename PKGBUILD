# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
# Contributor: Zeqadious <zeqadious.at.gmail.dot.com>
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>

pkgname=kodi-standalone-service
pkgver=1.8
pkgrel=2
pkgdesc="Systemd service and user to autostart kodi at boot"
arch=('x86_64' 'i686')
url="https://wiki.archlinux.org/index.php/Kodi#Kodi-standalone-service"
license=('GPL')
depends=('systemd' 'xorg-server' 'xorg-xinit' 'kodi' 'polkit')
replaces=('xbmc-standalone-service')
install=readme.install
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a165a66e976bb1a6ac622618887c2f9699acd84d8790af517b85a66bf5e0474c')

package() {
	install -Dm644 "$srcdir/$pkgname-$pkgver/init/kodi.service" \
		"$pkgdir/usr/lib/systemd/system/kodi.service"
	install -dm 700 "$pkgdir"/var/lib/kodi
	chown 420:420 "$pkgdir"/var/lib/kodi
}
