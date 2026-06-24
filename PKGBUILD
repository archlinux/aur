# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Samuel Walladge <samuel at swalladge dot net>

pkgname=tagspaces-bin
pkgver=6.13.4
pkgrel=1
pkgdesc="An offline, open source, document manager with tagging support"
arch=('x86_64')
url="https://www.tagspaces.org"
license=('AGPL-3.0-or-later')
depends=('alsa-lib' 'gtk3' 'libnotify' 'libsecret' 'nss' 'xdg-utils')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("https://github.com/tagspaces/tagspaces/releases/download/v$pkgver/${pkgname%-bin}-linux-amd64-$pkgver.deb")

sha256sums=('563c4d6a2044935a32f54d17ea29cde6c33d3ee75a52f9975bf95cc7eb29566a')

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/TagSpaces/${pkgname%-bin}" "$pkgdir/usr/bin/"
}
