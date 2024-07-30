# Maintainer: drpebcak <tayworm@gmail.com>
pkgname='clio-git'
pkgver=git
pkgrel=2
pkgdesc="Your friendly and safe CLI Copilot (git build from latest commit to main)"
arch=('x86_64')
url="https://github.com/gptscript-ai/clio"
license=('Apache')
makedepends=('git' 'go')
source=('clio::git+https://github.com/gptscript-ai/clio.git#branch=main')
noextract=()
md5sums=('SKIP')

build() {
	cd "clio"
	export CGO_ENABLED=0 
	go build -o bin/clio .
}

check() {
	cd "clio"
	./bin/clio -v
}

package() {
	cd "clio"
	install -Dm755 bin/clio "$pkgdir"/usr/bin/clio
}
