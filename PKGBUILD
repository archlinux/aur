# Maintainer: 1994 <1994intime@protonmail.com>

pkgname='zecwallet-light-cli-git'
pkgver=1.7.7.r1.g4e27257
pkgrel=1
pkgdesc="A command line ZecWallet light client"
arch=('any')
url="https://github.com/adityapk00/zecwallet-light-cli"
license=('MIT')
makedepends=('rust')
source=("${pkgname}"::"git+https://github.com/adityapk00/zecwallet-light-cli.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "${pkgname}"
	cargo build --release
}

package() {
	cd "${pkgname}"
	install -Dm 755 target/release/zecwallet-cli ${pkgdir}/usr/bin/zecwallet-cli
}

