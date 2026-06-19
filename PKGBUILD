# Maintainer: GrassBlock <i [at] gb0 [dot] dev>
pkgname=manboster
_name=manboster
pkgver=0.1.0
pkgrel=1
pkgdesc="Manboster: Your personal AI agent manbo lobster!"
arch=("x86_64")
url="https://manboster.dev/"
_giturl="https://github.com/manboster/manboster"
license=('Apache-2.0')
makedepends=("go")
optdepends=('llama.cpp: for running local safety gatekeeper model')
provides=("manboster")
conflicts=("manboster")
source=("$pkgname-$pkgver.tar.gz::$_giturl/archive/v$pkgver.tar.gz")
sha256sums=('eba40d5ecf27ce2c0e8da5d0b157b697a0322bfe90e2144ff741efc59b0f39f5')

build() {
	cd "${_name}-$pkgver"
	go build -o $_name ./cmd/$_name
}

package() {
	cd "${_name}-$pkgver"
	install -Dm 755 manboster -t ${pkgdir}/usr/bin
}
