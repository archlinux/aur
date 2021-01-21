# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=unf
pkgver=2.1.1
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="UNixize Filename -- replace annoying anti-unix characters in filenames"
license=('MIT')
url="https://github.com/io12/unf"
source=("https://github.com/io12/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4cf51c623a34de1704af512ecacccac1cfbc8edd64dff6ad0aaefd67a984ef2b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
