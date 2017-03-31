# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=soundcloud-m3u
pkgver=1.1.0
pkgrel=1
pkgdesc="A command line tool to generate .m3u playlists pointing to Soundcloud streams"
arch=('x86_64' 'i686')
url="http://github.com/dangodai/soundcloud-m3u"
license=('GPL3')
makedepends=('go' 'git')
source=("https://github.com/dangodai/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('cf750a80c8f781d5a559af3be4cdfc923c3755eab835c4e5ca4d52410cff9e65')

prepare() {
 mkdir -p "$srcdir/go"
 export GOPATH="$srcdir/go"
 go get github.com/kennygrant/sanitize
 go get github.com/yanatan16/golang-soundcloud/soundcloud
 cd $srcdir/$pkgname-$pkgver
 go build -o soundcloud-m3u
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  rm -r  "$srcdir/go"
}
# vim:set ts=2 sw=2 et:
