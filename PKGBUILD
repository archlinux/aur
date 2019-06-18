# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=unf
pkgver=0.1.1
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="UNixize Filename -- replace annoying anti-unix characters in filenames"
license=('MIT')
url="https://github.com/io12/unf"
source=("https://github.com/io12/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('5180ce43da9e0272db95dc98f65e4f3d')

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
