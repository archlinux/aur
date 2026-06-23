# Maintainer: GrassBlock <i [at] gb0 [dot] dev>
pkgname=manboster
_name=manboster
pkgver=0.2.3
pkgrel=1
pkgdesc="Manboster: Your personal AI agent manbo lobster!"
arch=("x86_64" "aarch64")
url="https://manboster.dev/"
_giturl="https://github.com/manboster/manboster"
license=('Apache-2.0')
makedepends=("go")
optdepends=('llama.cpp: for running local safety gatekeeper model')
provides=("manboster")
conflicts=("manboster-bin" "manboster-git")
source=("$pkgname-$pkgver.tar.gz::$_giturl/archive/v$pkgver.tar.gz")
sha256sums=('9ba16b7f58ee3ba93b8c413d286757641d248ab57a1f4889af74cce35dfeded4')

build() {
	cd "${_name}-$pkgver"
	go build -o $_name ./cmd/$_name
}

package() {
	cd "${_name}-$pkgver"
	install -Dm 755 manboster -t ${pkgdir}/usr/bin
}
