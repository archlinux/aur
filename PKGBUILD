# Maintainer: SpacingBat3 <spacingbat3+aur@gmail.com>
pkgname=netanim
pkgver=3.110
pkgrel=1
pkgdesc="Offline animator for ns-3"
arch=("x86_64")
url="https://www.nsnam.org/wiki/NetAnim"
license=('GPL-2.0-only')
makedepends=('cmake')
depends=('qt6-base')
optdepends=('ns3: Network simulator')
source=("https://gitlab.com/nsnam/$pkgname/-/archive/$pkgname-$pkgver/$pkgname-$pkgname-$pkgver.tar.gz")
sha256sums=('3a5b8760cc537096842cd98a2a2c638a5cb7a51516c54a593825a642f1daa9a8')
sha512sums=('40a98c45bdb8a1f6adfafd03dfaeb23ef795ab16f68617b2ef2a3502d6ea28bf190bc60bb7260ac16f1311dec637a9cc256b667b86d254a61818c8a1ee8110b4')
b2sums=('1027f4b5b94eac7b9774f6a3e8bffa41c3afb1792a6c18f136c183bb41f32cb9556633aa66a33273cbaa9bc7a9c10aa5047f0f419fae1a932f2e922dce9a4590')
vtalidpgpkeys=()

build() {
    cmake \
        -S "$pkgname-$pkgname-$pkgver" -B "$pkgname-build" \
        -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    # Note: for netanim>3.110: -DPACKAGING=ON
    cmake --build "$pkgname-build"
}

#check() {
    # This is for the future!!!
    # Currently there should be no tests,
    # but I assume this might change.
    #ctest "$pkgname-build"
#}

package() {
	env DESTDIR="$pkgdir/" cmake --install "$pkgname-build"
}
