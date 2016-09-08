# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
# Contributor: Zeqadious <zeqadious.at.gmail.dot.com>
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>

pkgname=kodi-standalone-service
pkgver=1.81
pkgrel=1
pkgdesc="Systemd service and user to run kodi in stand-alone mode"
# Arch ARM users do NOT attempt to use this package on Arch ARM!
# This is only for x86_64 and i686. You have been warned.
arch=('x86_64' 'i686')
url="https://wiki.archlinux.org/index.php/Kodi#Kodi-standalone-service"
license=('GPL')
depends=('systemd' 'xorg-server' 'xorg-xinit' 'kodi' 'polkit')
replaces=('xbmc-standalone-service')
install=readme.install
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('06910727cf133aeeb07dbe40dd3c1cf1b2dd2ed71b5d98ae7e9c352e7a59a70c')

package() {
	install -Dm644 "$srcdir/$pkgname-$pkgver/init/kodi.service" \
		"$pkgdir/usr/lib/systemd/system/kodi.service"
	install -dm 700 "$pkgdir"/var/lib/kodi
	chown 420:420 "$pkgdir"/var/lib/kodi
}
