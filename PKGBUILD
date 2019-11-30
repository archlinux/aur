# Maintainer: techfreak <techfreak@matrix.org>
pkgname=arch-sec-check-git 
pkgver=1.1
pkgrel=1
pkgdesc="Compares your local installed packages with the arch linux security database"
arch=(any)
url="https://gitlab.com/techfreak/arch-sec-check"
license=(GPL2)
depends=(openssl)
makedepends=(git cargo rust)
optdepends=()
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
  cd ${pkgname} 
  cargo build --release
}

package() {
  cd ${pkgname}
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
