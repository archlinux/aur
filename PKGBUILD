# Maintainer: Jakub Trnka <jakub.trnka@braiins.cz>

pkgname=stratum-mining-proxy
pkgver=1
pkgrel=1
pkgdesc="Stratum mining and aggregating proxy"
arch=('x86_64')
url="https://github.com/braiins/stratum-mining-proxy"
license=('GPL')
depends=('python2')
makedepends=('python-virtualenv')
checkdepends=()
optdepends=()
provides=('stratum-mining-proxy')
options=()
source=(
	git+https://github.com/braiins/stratum-mining-proxy
	git+https://github.com/braiins/stratum
	PKGBUILD.sig
	build.sh
	requirements.txt
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'3a6d38c4693fb0b3b16363fe5860fa86aa831c00592adcf355f15e67c7740585'
	'd8a5e14eedb81c15fdfcd7fccd5e5d6457bb0fd1bed4e7350e2ed92519e30cfd'
)

prepare() {
	virtualenv --python python2 .proxyenv
}

build() {
	bash build.sh
}

package() {
	mkdir -p $pkgdir/usr/bin/
	mv dist/stratum-mining-proxy $pkgdir/usr/bin
}

