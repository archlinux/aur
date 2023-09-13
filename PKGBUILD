# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: xyzzy

pkgname=spotify-adblock
pkgver=1.0.3
pkgrel=2
epoch=1
pkgdesc='Adblocker for Spotify'
arch=('x86_64')
url=https://github.com/abba23/spotify-adblock
license=('GPL3')
depends=('spotify')
makedepends=('rust')
provides=("$pkgname-linux")
replaces=("$pkgname-linux")
backup=('etc/spotify-adblock/config.toml')
options=('!strip')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")
b2sums=('37773e04cc77c049bbf3c40a0d9e6e6733c2038b3a4f3bbad97c18f4ce9163631699aff8c0e71efd96ea833eb8b40d195553e71f3c7bf8d7cc73eba56578de78'
        '39f7b71aa8b6b894513812742b5ecbd4ab9ee60482f455555529be356b93724a663d9b4db21675b51db615594ed73fa7657eeab6d2b1679cd6a5572b2566a68a')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir"/usr/share/applications ../$pkgname.desktop
}

# vim:set ts=2 sw=2 et:
