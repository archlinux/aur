# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=sweetlock-bin
_pkgname=sweetlock
pkgver=0.1.1
pkgrel=1
pkgdesc="Screen locker for Wayland"
arch=('x86_64')
url="https://github.com/sweetwm/sweetlock"
license=('GPL-3.0-or-later')
options=('!debug')
depends=('glibc' 'wayland' 'libxkbcommon' 'pam' 'cairo' 'pango' 'glib2'
         'libjpeg-turbo')
optdepends=(
  'noto-fonts: the default font'
  'fprintd: fingerprint unlock'
  'pam-u2f: security key unlock'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=('etc/pam.d/sweetlock')
source_x86_64=("$_pkgname-$pkgver-$CARCH-linux.tar.xz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-$CARCH-linux.tar.xz")
sha256sums_x86_64=('b57330e4883720393c7e27a165bfd9874229b837d0dac6581704d2204f47f2c6')

package() {
  # the tarball holds usr/ and etc/pam.d
  cp -a usr etc "$pkgdir/"
}
