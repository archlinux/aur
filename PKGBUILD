# Maintainer: drpebcak <tayworm@gmail.com>
pkgname='gptscript-git'
pkgver=git
pkgrel=1
pkgdesc="Scripting AI for fun and profit (git build from latest commit to main)"
arch=('x86_64')
url="https://gptscript.ai/"
license=('Apache')
makedepends=('git' 'go' 'npm' 'yarn')
source=('gptscript::git+https://github.com/gptscript-ai/gptscript.git#branch=main')
noextract=()
md5sums=('SKIP')

build() {
	cd "gptscript"
	make build-ui
	make build
}

check() {
	cd "gptscript"
	./bin/gptscript -v
}

package() {
	cd "gptscript"
	install -Dm755 bin/gptscript "$pkgdir"/usr/bin/gptscript
}
