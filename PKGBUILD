# Maintainer: ctbur <cyrill.burgener+aur@gmail.com>

pkgname=async
pkgver=0.1.1
pkgrel=1
pkgdesc="A tool to run shell commands in parallel."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/ctbur/async"
license=('GPL3')
depends=()
makedepends=('rust' 'cargo')
conflicts=()
source=("https://github.com/ctbur/async/archive/v${pkgver}.tar.gz")
sha512sums=('29200938bafe9a753ff790f8f10c22d03d86fbaaf9d6acffa1cd8fe800821b702366f0a465d7a05cf7e209be3e5988d6e6782a448fd78febb46156801628e892')

build() {
  cd "${srcdir}/async-${pkgver}"
  cargo build --release --locked
}

#check() {
#  cd "${srcdir}/async-${pkgver}"
#  cargo test --release --locked
#}

package() {
  cd "${srcdir}/async-${pkgver}"
  install -Dm 755 "target/release/async" "${pkgdir}/usr/bin/async"
}

