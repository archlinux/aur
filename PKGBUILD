# Maintainer: Antoine POPINEAU <antoine at popineau dot eu>

pkgname=greetd-tuigreet
pkgver=0.1.1
pkgrel=1

pkgdesc='A console UI greeter for greetd'
url='https://github.com/apognu/tuigreet'
license=(GPL3)
conflicts=(greetd-tuigreet-bin greetd-tuigreet-git)

arch=(x86_64)
depends=()
makedepends=(rust)

source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('7e9c9a929835d3385a4ba9dd33c750fdef86066a61e80e7994ea2f034c188346')

build() {
  cd "tuigreet-${pkgver}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/tuigreet-${pkgver}/target/release/tuigreet" "${pkgdir}/usr/bin/tuigreet"
  install -Dm644 "${srcdir}/tuigreet-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/tuigreet/LICENSE"
}
