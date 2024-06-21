# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Samuel Walladge <samuel at swalladge dot net>
pkgname=tagspaces-bin
pkgver=5.8.6
pkgrel=1
pkgdesc="An offline, open source, document manager with tagging support"
arch=('x86_64')
url="https://www.tagspaces.org"
license=('AGPL-3.0-or-later')
depends=('alsa-lib' 'gtk3' 'libnotify' 'libsecret' 'nss' 'xdg-utils')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/tagspaces/tagspaces/releases/download/v$pkgver/${pkgname%-bin}-linux-amd64-$pkgver.deb")
sha256sums=('a3f62969ad520028440a7a8197888114415327f2bb27176550b71fe01dc1ab17')

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/TagSpaces/${pkgname%-bin}" "$pkgdir/usr/bin/"
}
