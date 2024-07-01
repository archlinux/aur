# Maintainer: Livaco <livaco@livaco.dev>
pkgname=crab-fetch
pkgver=0.3.1
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
source=("https://github.com/LivacoNew/CrabFetch/archive/refs/tags/v0.3.1.tar.gz")
sha512sums=('d394237b9b3e0b46a0c3a7905d734246871768c9134868072f1a1a9f044cd862f7871d2ec16cb757e3fec7a849b75d05096aa6518fbbde5a3aa11af128ca7ad0')

build() {
	cd "${srcdir}/CrabFetch-${pkgver}"
    # verbose in case issues arise, makes debugging step instant
    cargo build -rv
}

package() {
	cd "${srcdir}/CrabFetch-${pkgver}"
    # hardcoded "crabfetch" cus the package name is different
    install -Dm 755 ./target/release/crabfetch ${pkgdir}/usr/local/bin/crabfetch
    install -Dm 755 ./LICENCE ${pkgdir}/usr/share/licenses/crabfetch/LICENCE
}
