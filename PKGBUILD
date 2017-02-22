# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
# Contributor: Zeqadious <zeqadious.at.gmail.dot.com>
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>

pkgname=kodi-standalone-service
pkgver=1.82
pkgrel=1
pkgdesc="Systemd service to run kodi in stand-alone mode without a DE"
# Do NOT attempt to use this package on Arch ARM! This is only for x86_64/i686.
# You have been warned.
arch=('x86_64' 'i686')
url="https://wiki.archlinux.org/index.php/Kodi#Kodi-standalone-service"
license=('GPL')
depends=('systemd' 'xorg-server' 'xorg-xinit' 'kodi' 'polkit')
replaces=('xbmc-standalone-service')
install=readme.install
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('56753e01f594df719ff3efa677ff17f6920b9f61b655876f0dc70445fa69e439')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/init/kodi.service" \
    "$pkgdir/usr/lib/systemd/system/kodi.service"
  install -dm 700 "$pkgdir"/var/lib/kodi
  chown 420:420 "$pkgdir"/var/lib/kodi
}

# vim:set ts=2 sw=2 et:
