# Maintainer: loh.tar <loh.tar at googlemail dot com>
pkgname='pass-paste'
pkgver='0.8.1'
pkgrel='1'
pkgdesc='An extension for pass: paste passwords by mouse without clipboard.'
arch=('any')
url="https://github.com/loh-tar/$pkgname"
license=('GPL')
# namcap complains nothing of these are needed(?)
depends=('pass' 'xorg-server' 'xdotool' 'xorg-xwininfo' 'xorg-xprop')
install="$pkgname.install"
changelog="release-notes.txt"
source=("$pkgname-$pkgver.tar.gz::https://github.com/loh-tar/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('200835f41514b9ed730d47266a2a70ffb7c2d35f1f1a8c52293526f311fdf731')

prepare() {
  # Update/Copy/Fetch release-notes/changelog It's not possible to referenz above direct
  cp "$pkgname-$pkgver/release-notes.txt" ../
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}
