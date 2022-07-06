# Maintainer:  <zhaose@Planet>
pkgname=m3u8-downloader-go-git
provides=('m3u8-downloader')
conflicts=('m3u8-downloader')
pkgver=v2.2.r0.g975649d
pkgrel=1
pkgdesc="m3u8 video downloader written in go"
arch=('any')
url="https://github.com/llychao/m3u8-downloader"
license=('MIT')
#depends=('')
makedepends=('go' 'git')
source=("$pkgname::git+https://github.com/llychao/m3u8-downloader")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  
  go build -o m3u8-downloader
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "$srcdir/$pkgname/m3u8-downloader" -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/m3u8-downloader/"
}

# vim:set ts=2 sw=2 et:
