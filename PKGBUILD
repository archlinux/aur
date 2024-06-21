# Maintainer: Anony <i@anodite.me>
pkgname=warpdl
pkgver=1.0.4
pkgrel=1
pkgdesc="A powerful and versatile cross-platform download manager."
arch=('any')
url="https://github.com/warpdl/$pkgname"
license=('MIT')
optdepends=('ffmpeg')
makedepends=('go>=1.21')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d389d74f25328dd2a812ac2f17e14082eaeef71280b9ed8f8163caf54cd26f8a')

build() {
	cd "$pkgname-$pkgver"
	go build \
		-ldflags "-s -w -X main.version=$pkgver -X main.commit=64744e5f5316f5b366bbd0713301a84831868976 -X main.date=2024-03-18T21:31:29Z -X main.BuildType=stable" \
		-o ..
}

package() {
	install -Dm755 $srcdir/warpdl "$pkgdir/usr/bin/warpdl"
}
