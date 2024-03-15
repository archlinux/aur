# Maintainer: drpebcak <tayworm@gmail.com>
pkgname='gptscript'
pkgver="v0.2.1"
pkgrel=1
pkgdesc="Scripting AI for fun and profit"
arch=('x86_64')
url="https://gptscript.ai/"
license=('Apache')
makedepends=('git' 'go' 'npm' 'yarn')
source=("gptscript-$pkgver::git+https://github.com/gptscript-ai/gptscript#tag=$pkgver")
noextract=()
md5sums=('SKIP')
conflicts=('gptscript-git')

build() {
	cd "gptscript-$pkgver"
	make all
}

check() {
	cd "gptscript-$pkgver"
	./bin/gptscript -v
}

package() {
	cd "gptscript-$pkgver"
	install -Dm755 bin/gptscript "$pkgdir"/usr/bin/gptscript
}
