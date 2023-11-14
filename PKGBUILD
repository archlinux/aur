# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Mogeko <zhengjunyi@live.com>

pkgname=alass
pkgver=2.0.0
pkgrel=2
pkgdesc="Automatic Language-Agnostic Subtitle Synchronization"
arch=('x86_64')
url='https://github.com/kaegi/alass'
license=('GPL3')
depends=('ffmpeg')
makedepends=('cargo')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kaegi/alass/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ce88f92c7a427b623edcabb1b64e80be70cca2777f3da4b96702820a6cdf1e26')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/alass-cli "${pkgdir}/usr/bin/alass"
}
