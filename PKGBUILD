# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: maz-1 <ohmygod19993 at gmail dot com>

_pkgname=deadbeef-plugin-jack
pkgname=$_pkgname-git
pkgver=r10.62d1e6a
pkgrel=1
pkgdesc="JACK output plugin for DeaDBeeF music player (latest commit)"
url="https://github.com/DeaDBeeF-Player/jack"
url2="http://deadbeef.sourceforge.net/plugins.html"
arch=('x86_64' 'i686')
license=('MIT')
depends=('deadbeef' 'jack')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd jack
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd jack
  make
}

package() {
  cd jack
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 jack.so -t "$pkgdir/usr/lib/deadbeef"
}
