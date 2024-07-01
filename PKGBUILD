# Maintainer: Livaco <livaco@livaco.dev>
pkgname=crab-fetch
pkgver=0.3.0
pkgrel=2
pkgdesc="Extremely fast, featureful and customizable command-line fetcher."
arch=('x86_64')
url="https://github.com/LivacoNew/CrabFetch"
license=('Apache-2.0')
depends=("glibc" "gcc-libs")
optdepends=("mesa-utils" "pciutils")
makedepends=("rustup")
provides=("crabfetch")
conflicts=("crabfetch")
source=("https://github.com/LivacoNew/CrabFetch/archive/refs/tags/v0.3.0.tar.gz")
sha512sums=('0ae12960cefaa097f3863089ea0a5514dd0e9c8fd4464c932f8c838211175fba64ba18d15a559ac56e9445c0f88a46f6c8954206afe5102e63cece02ce2e59a3')

build() {
	cd "${srcdir}/CrabFetch-${pkgver}"
    # verbose in case issues arise, makes debugging step instant
    cargo build -rv
}

package() {
	cd "${srcdir}/CrabFetch-${pkgver}"
    # hardcoded "crabfetch" cus the package name is different
    install -Dm 755 ./target/release/crabfetch ${pkgdir}/usr/local/bin/crabfetch
}
