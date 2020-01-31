# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: xyzzy <628208@gmail.com>

pkgname=spotify-adblock-linux
pkgver=1.1
pkgrel=1
pkgdesc='Spotify adblocker for Linux'
arch=('x86_64')
url=https://github.com/abba23/spotify-adblock-linux
license=('GPL3')
depends=('spotify')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        "spotify-adblock.desktop")
sha512sums=('e9fe2f3aaf22314d60027dbae93d9b869fa7f08667062a9e44c707a6c5394dbbc6e77efad8f9d93f183c64ec413388e7d36c084bfe8e8401e1fe82157191ec0a'
            '69f497a0b869e855b7c6c733c73ee3f285000d56543bf5083382fe1957a9be9a27f8e7eff6e3ef5ccaf5c12ee7750c7e8561bef54e688e5b8b738b320f5cf90a')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir"/usr/share/applications ../spotify-adblock.desktop
}
