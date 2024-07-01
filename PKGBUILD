# Maintainer: Livaco <livaco@livaco.dev>
pkgname=crab-fetch
pkgver=0.3.0
pkgrel=1
pkgdesc="Extremely fast, featureful and customizable command-line fetcher."
arch=('x86_64')
url="https://github.com/LivacoNew/CrabFetch"
license=('Apache-2.0')
depends=("glibc" "gcc-libs")
optdepends=("mesa-utils" "pciutils")
makedepends=("rustup")
provides=("crabfetch")
conflicts=("crabfetch")
source=("https://github.com/LivacoNew/CrabFetch/archive/refs/tags/v0.2.0.tar.gz")
sha512sums=('8643f460c14b2da076c03be27f18aedd6fbdd505f90d450a7c97fcad9ecd890d74c164ca6527d4e050bbfaedbfac08af740086fc59f1dcad0f542f21af27a20e')

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
