# Maintainer: Thomas Letan <lthms@soap.coffee>

pkgname=octez-smart-rollup-node
pkgver=20.1
pkgrel=4
pkgdesc='Unofficial binary release for the octez-smart-rollup-node from Octez'
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
  "$pkgname-$pkgver-$pkgrel::https://gitlab.com/tezos/tezos/-/package_files/133746818/download"
  "$pkgname.sysusers"
  "$pkgname.tmpfiles"
  "$pkgname@.service"
)
sha512sums=('4f8aec8dc0d57f7e5b835d62d04855eb50ab374be31a5ac2cf37b27f85b0a9ca42fbaf24911704223620423535daff575c22e5d5790bf0ebd6f89ae1cb13e267'
            '4c7f574d08436ac8e5acbfc47a5a895c0401b44e96391bf6489fe80174e04982a6fd618a45db47c4994f30d3db95827417d849b98f02cb9b27266897cd64cf31'
            '1bfdc8af0663d18abcda427995198bd1948bb85c3b05f1e769a02530d70e0858d3a5d2d5d1d21294bb8a7a68cac023ca6f8ee13440fabc79dcb40dde8761ee56'
            '83ec9dc8bfe009962d3d882fb917ed1b4da2e1593acf7f7b1480550734530b0e66058ecb73edd0f05edb9787ce99719c974a84d29b65083f26b326cac797ea87')

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
