# Maintainer: Thomas Letan <lthms@soap.coffee>

pkgname=octez-node-19
pkgver=2
pkgrel=1
pkgdesc='Unofficial binary release for the octez-node from Octez 19'
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
  "$pkgname-$pkgver-$pkgrel::https://gitlab.com/tezos/tezos/-/package_files/123084614/download"
  "$pkgname.sysusers"
  "$pkgname.tmpfiles"
  "$pkgname@.service"
)
sha512sums=(
  '56480ba523f782a47cd1609cbee0cea301119be4ab489f7ba2e23c8cc43fa3a4ed831d56a8ea7fb4b41e7e25115daa4063faad3ca0da3719001e1efc9d7c9580'
  '4c7f574d08436ac8e5acbfc47a5a895c0401b44e96391bf6489fe80174e04982a6fd618a45db47c4994f30d3db95827417d849b98f02cb9b27266897cd64cf31'
  '1bfdc8af0663d18abcda427995198bd1948bb85c3b05f1e769a02530d70e0858d3a5d2d5d1d21294bb8a7a68cac023ca6f8ee13440fabc79dcb40dde8761ee56'
  '461929de4c191ee43ad67f527711b42cf5e88c7e79bb7862d8016de208a0adb8a849658c3f527b514164278cd31fcad86308b82df7265c69f9ebb2f4c63df703'
)

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
