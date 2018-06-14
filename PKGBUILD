_gopkgname='github.com/McKael/madonctl'

pkgname=madonctl
pkgver=2.3.1
pkgrel=1
pkgdesc='CLI client for the Mastodon social network API'
arch=('x86_64')
url='https://github.com/McKael/madonctl'
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://$_gopkgname/archive/v$pkgver.tar.gz")
md5sums=('c9c928b98b6d1a1ac27227ace0002edb')

prepare() {
	cd "$pkgname-$pkgver"
	GOPATH=$(pwd) go get -d -v
}

build() {
	cd "$pkgname-$pkgver"
	GOPATH=$(pwd) go build -v -o "$srcdir"/madonctl
}

package() {
	install -Dm755 "$srcdir"/madonctl "$pkgdir"/usr/bin/madonctl
}
