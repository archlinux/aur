# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=cargo-benchcmp
pkgver=0.4.4
pkgrel=1
pkgdesc="A small utility to compare Rust micro-benchmarks"
url="https://github.com/BurntSushi/cargo-benchcmp"
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT' 'UNLICENSE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BurntSushi/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('9bb99e5838ad694a9182a22e2f568dbe88e4de6e530d23dabfa3b9d813a5361d1db095c3d5a713d9319527880fc17b6e2b16806b263f22cf79cf3bac846e463e')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT UNLICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
