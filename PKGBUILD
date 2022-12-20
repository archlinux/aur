# Maintainer: Jon Osterman <pro.dev.account@protonmail.com>
pkgname='iroh-git'
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="An Implementation IPFS in Rust"
arch=('x86_64')
url="https://github.com/n0-computer/iroh"
license=('MIT')
depends=('git' 'cargo')
makedepends=('git')
checkdepends=('cargo')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname::git+https://github.com/n0-computer/iroh.git#tag=v${pkgver})
# noextract=($pkgname)
md5sums=('908462978506cdf5c4955a3d54e1f605')

validpgpkeys=()

prepare() {
	cd $pkhname
}

build() {
	cd $pkgname
	cargo build
}

#check() {
#	cd $pkgname
#	cargo test --no-fail-fast
#}

package() {
	cd $pkgname
	install -Dm 755 target/debug/iroh -t "${pkgdir}/usr/bin"
	install -Dm 755 target/debug/iroh-p2p -t "${pkgdir}/usr/bin"
	install -Dm 755 target/debug/iroh-gateway -t "${pkgdir}/usr/bin"
	install -Dm 755 target/debug/iroh-store -t "${pkgdir}/usr/bin"
}
