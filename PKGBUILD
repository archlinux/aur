# Maintainer: rnestler

pkgname=attractorr
pkgver=0.4.2
pkgrel=1
pkgdesc='CLI to search for torrent magnet links'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/${pkgname}"
license=('APACHE')
makedepends=('cargo')
depends=('openssl' 'gcc-libs')
source=("https://github.com/rnestler/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('af708bf8890237e3b28aa17e8c0f135f8b5a54d02233da6eab6176267294cd39')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  cp -p target/release/${pkgname} "${pkgdir}/usr/bin"
}
