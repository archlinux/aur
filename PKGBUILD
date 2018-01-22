# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=gox
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple, no-frills tool for Go cross compilation"
arch=('i686' 'x86_64')
url='https://github.com/mitchellh/gox'
license=('MPL')
makedepends=('go' 'git')
source=("https://github.com/mitchellh/gox/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2df7439e9901877685ff4e6377de863c3c2ec4cde43d0ca631ff65d1b64774ad')

prepare() {
	GOPATH="$srcdir" go get github.com/mitchellh/iochan
}

build() {
	cd $pkgname-$pkgver
	GOPATH="$srcdir" go build
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 $pkgname-$pkgver "$pkgdir"/usr/bin/$pkgname
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
