# Maintainer: Perttu Luukko (firstname at lastname dot fi)
pkgname=jump
pkgver=0.23.0
pkgrel=1
pkgdesc="Quick and fuzzy directory jumper"
arch=("i686" "x86_64")
url="https://github.com/gsamokovarov/jump"
license=("MIT")
depends=("glibc")
makedepends=("go")
conflicts=("jump-git")
source=("https://github.com/gsamokovarov/jump/archive/v${pkgver}.tar.gz")
sha256sums=("decb93cdccf0aff1ed9ab503af320aaa723998178f1d62331e6966726e6487d2")

build() {
	cd "$srcdir/jump-${pkgver}"
	go build
}

package() {
  cd "$srcdir/jump-${pkgver}"
  install -Dm755 jump "${pkgdir}/usr/bin/jump"
  install -Dm644 man/jump.1 "${pkgdir}/usr/share/man/man1/jump.1"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
