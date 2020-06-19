# Maintainer: The Puzzlemaker <tpzker at `echo "dGhlcHV6emxlbWFrZXIuaW5mbwo=" | base64 -d`>

pkgname=rtfm
pkgver=0.1.0
pkgrel=1
pkgdesc='Open the Arch Wiki search page for a string from the command line'
arch=('i686' 'x86_64')
url="https://github.com/ThePuzzlemaker/rtfm"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ThePuzzlemaker/rtfm/archive/v${pkgver}.tar.gz")
sha512sums=('7356c2973df71034ec11f64322771f1517508579764ac8d41c35398b9aaf27728eb556d32119e24c25212e26c888ab2b4c9f92ee73e9fe287d9b4af1044d8821')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 target/release/rtfm "${pkgdir}/usr/bin/rtfm"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
