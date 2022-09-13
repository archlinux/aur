# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=emojiterm
pkgver=0.3.2
pkgrel=1
pkgdesc='List and display all available GitHub emojis, using the GitHub API'
arch=(x86_64)
url='https://github.com/xyproto/emojiterm'
license=(BSD)
makedepends=(go git)
source=("git+$url#commit=f311b695fdf95c5f19b2d9bdb7790faf049814e7") # tag: v0.3.2
b2sums=(SKIP)

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags $LDFLAGS"
}

package() {
  install -Dm755 "$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
