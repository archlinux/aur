# Maintainer: Afri 5chdn <aur@cach.co>

pkgname=parity
pkgver=1.0.2
pkgrel=1
pkgdesc="The fast, light, robust Ethereum client."
arch=('x86_64')
conflicts=('parity-git')
provides=('parity')
url="https://ethcore.io/parity.html"
license=('GPL')
source=(
  "${pkgname}-${pkgver}.deb::https://github.com/ethcore/parity/releases/download/v1.0.2/parity_linux_1.0.2-0_amd64.deb"
  "COPYING::https://raw.githubusercontent.com/ethcore/parity/master/LICENSE"
)
sha256sums=(
  '0ee68396e36625540a370042aa7a6f16d475f2269c997c5b82455e58eaad05d3'
  'd62f065830aa3739cc031156b9690805c7b2e811b4a178c8b4acd8725d561c94'
)

prepare() {
    tar xf "$srcdir/data.tar.xz"
    #rm -rf "$srcdir/usr/share/"
}

package() {
  install -Dm755 "$srcdir/usr/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
