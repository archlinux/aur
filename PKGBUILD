# Maintainer: Stefan Mark <mark at unserver dot de>

pkgname=madasul-git
_pkgname=maasul
pkgver=666.0.3
pkgrel=1
pkgdesc="A really simple playlist daemon"
url="https://git.weitnahbei.de/nullmark/madasul"
arch=('i686' 'x86_64')
license=('GPL')
depends=('socat')
optdepends=('mpg321: example musicplayer config' 'ogg128: example musicplayer config' 'libnotify: example musicplayer config' 'id3v2: example playlist generator' 'vorbis-tools: example playlist generator' 'dmenu: example gui interface' 'saparoton: interface for madasul')
makedepends=('git')
provides=('madasul')
conflicts=('madasul')
source=("$_pkgname::git+http://git.weitnahbei.de/nullmark/madasul")
sha256sums=('SKIP')

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README.md"
}
