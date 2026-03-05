# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Samuel Walladge <samuel at swalladge dot net>

pkgname=tagspaces-bin
pkgver=6.9.2
pkgrel=1
pkgdesc="An offline, open source, document manager with tagging support"
arch=('x86_64')
url="https://www.tagspaces.org"
license=('AGPL-3.0-or-later')
depends=('alsa-lib' 'gtk3' 'libnotify' 'libsecret' 'nss' 'xdg-utils')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("https://github.com/tagspaces/tagspaces/releases/download/v$pkgver/${pkgname%-bin}-linux-amd64-$pkgver.deb")

sha256sums=('ab3ecad3d06b6aef5fd55320931f949f5279e23de9555c3bafb83065deca2187')

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/TagSpaces/${pkgname%-bin}" "$pkgdir/usr/bin/"
}
