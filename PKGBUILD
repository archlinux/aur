# Maintainer: Livaco <livaco@livaco.dev>
pkgname=crab-fetch
pkgver=0.1.0
pkgrel=2
pkgdesc="A highly configurable command-line fetch tool thats also performant."
arch=('x86_64')
url="https://github.com/LivacoNew/CrabFetch"
license=('Apache-2.0')
depends=("glibc" "gcc-libs")
optdepends=("mesa-utils" "pciutils")
makedepends=("rustup")
provides=("crabfetch")
conflicts=("crabfetch")
source=("https://github.com/LivacoNew/CrabFetch/archive/refs/tags/v0.1.0.tar.gz")
sha512sums=('d280c48682cc7dab82f8d6c1256a586f1b7229deb9a968e1bf6a36eeb76d1af70365f8075360e8c89055374a77030fe1c5a5e623993ae9ab59276358e069b1e8')

build() {
	cd "${srcdir}/CrabFetch-${pkgver}"
    # verbose in case issues arise, makes debugging step instant
    cargo build -rv
}

package() {
	cd "${srcdir}/CrabFetch-${pkgver}"
    # hardcoded "crabfetch" cus the package name is different
    install -Dm 755 ./target/release/crabfetch ${pkgdir}/usr/bin/crabfetch
}
