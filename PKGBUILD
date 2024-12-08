# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Samuel Walladge <samuel at swalladge dot net>
pkgname=tagspaces-bin
pkgver=6.1.1
pkgrel=1
pkgdesc="An offline, open source, document manager with tagging support"
arch=('x86_64')
url="https://www.tagspaces.org"
license=('AGPL-3.0-or-later')
depends=('alsa-lib' 'gtk3' 'libnotify' 'libsecret' 'nss' 'xdg-utils')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/tagspaces/tagspaces/releases/download/v$pkgver/${pkgname%-bin}-linux-amd64-$pkgver.deb")
sha256sums=('2f4cc1e35318f0cb3b97732c857f9eacf8d9725e8789518da4fed9484ff35e06')

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/TagSpaces/${pkgname%-bin}" "$pkgdir/usr/bin/"
}
