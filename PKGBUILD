# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=smag
pkgver=0.5.4
pkgrel=1
pkgdesc='Easily create graphs from cli commands and view them in the terminal.'
url='https://github.com/aantn/smag/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/aantn/smag//archive/v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
makedepends=('cargo')
sha256sums=('083eced510b7492ac7a1678e5fd68416cb3844e83a5153514ded1eb2414d885d')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --release --target-dir=target
}

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --all-features --target-dir=target
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
