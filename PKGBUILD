# Maintainer: Thomas Letan <lthms@soap.coffee>

pkgname=octez-node
pkgver=20.1
pkgrel=1
pkgdesc='Unofficial binary release for the octez-node from Octez'
url=https://gitlab.com/tezos/tezos
license=('MIT')
arch=('x86_64')
depends=(
  'octez-zcash-params'
)
makedepends=(
  'systemd'
)
source=(
  "$pkgname-$pkgver-$pkgrel::https://gitlab.com/tezos/tezos/-/package_files/133747102/download"
  "$pkgname.sysusers"
  "$pkgname.tmpfiles"
  "$pkgname@.service"
)
sha512sums=('0d56a9d3e3f5aa2576b9e13a488f4ac294d3acfc9a3779394eeead01cdd8dc0c350c5cb9da2dfd420dea5446429934978672b80ace449941a8deec25b03f4769'
            '4c7f574d08436ac8e5acbfc47a5a895c0401b44e96391bf6489fe80174e04982a6fd618a45db47c4994f30d3db95827417d849b98f02cb9b27266897cd64cf31'
            '1bfdc8af0663d18abcda427995198bd1948bb85c3b05f1e769a02530d70e0858d3a5d2d5d1d21294bb8a7a68cac023ca6f8ee13440fabc79dcb40dde8761ee56'
            '7c5527c270194accbc31b7eedba8e24c4fac501cd0a6559cec43b3c77658804b85d6f20e6e216d520a6e3189a08b29c8cba73f79e28da47b76dc513e1aa43aca')

build() {
  cd "$srcdir"
}

package() {
  cd "$srcdir"
  install -Dm 755 "$pkgname-$pkgver-$pkgrel" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 "$pkgname@.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "$pkgname.sysusers" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm 644 "$pkgname.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/$pkgname.conf"
}
