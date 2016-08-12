# Maintainer: Afri 5chdn <aur@cach.co>

pkgname=parity
pkgver=1.3.0
pkgrel=1
pkgdesc="The fast, light, robust Ethereum client."
arch=('x86_64')
conflicts=('parity-git')
provides=('parity')
url="https://ethcore.io/parity.html"
license=('GPL')
source=(
  "${pkgname}-${pkgver}.deb::https://github.com/ethcore/parity/releases/download/v${pkgver}/parity_${pkgver}-0_amd64.deb"
  "COPYING::https://raw.githubusercontent.com/ethcore/parity/master/LICENSE"
)
sha256sums=(
  '0d49c611db5d3699a200f46c253359fe813c30ea95706af413633d18e27aa290'
  'd62f065830aa3739cc031156b9690805c7b2e811b4a178c8b4acd8725d561c94'
)

prepare() {
  tar xf "$srcdir/data.tar.xz"
}

package() {
  install -Dm755 "$srcdir/usr/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

