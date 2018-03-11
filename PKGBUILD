#Maintainer: ParadoxSpiral <skullduggery@riseup.net>
pkgname=axon-git
provides=('axon')
conflicts=('axon')
pkgver=r97.4e518f9
pkgrel=1
pkgdesc='The synpase TUI'
arch=('i686' 'x86_64')
url='https://axon.synapse-bt.org'
license=('GPLv3')
depends=('openssl')
makedepends=('cargo' 'git')
source=(
	git+https://github.com/ParadoxSpiral/axon
)
sha256sums=('SKIP')

pkgver() {
	cd axon
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd axon
	cargo build --release
}

package() {
	cd axon
	install -Dm755 target/release/axon "$pkgdir"/usr/bin/axon
}
