# Maintainer: Livaco <livaco@livaco.dev>
pkgname=crab-fetch
pkgver=0.1.1
pkgrel=1
pkgdesc="A highly configurable command-line fetch tool thats also performant."
arch=('x86_64')
url="https://github.com/LivacoNew/CrabFetch"
license=('Apache-2.0')
depends=("glibc" "gcc-libs")
optdepends=("mesa-utils" "pciutils")
makedepends=("rustup")
provides=("crabfetch")
conflicts=("crabfetch")
source=("https://github.com/LivacoNew/CrabFetch/archive/refs/tags/v0.1.1.tar.gz")
sha512sums=('b6bf8fa5adcf63f9b3d96da5237e7474f9b65d18e91ac48b9c6319ff68c62487973cdb4b733d751624d17fdf222e7d0f7ce70ecf5c851166c4b7758506b3e4a3')

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
