# Maintainer: Thomas Letan <lthms@soap.coffee>

pkgname=octez-smart-rollup-node
pkgver=20.0_rc1
pkgrel=1
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
  "$pkgname-$pkgver-$pkgrel::https://gitlab.com/tezos/tezos/-/package_files/121917068/download"
  "$pkgname.sysusers"
  "$pkgname.tmpfiles"
  "$pkgname@.service"
)
sha512sums=(
  'effef0769446ab3705caec2808b0028e4d1693b54158220a522a4f4c4c4ec1bad4d20a6de92e401f668a222810d8d43a6356c5a801a85a66c34d97f12b05bb23'
  '4c7f574d08436ac8e5acbfc47a5a895c0401b44e96391bf6489fe80174e04982a6fd618a45db47c4994f30d3db95827417d849b98f02cb9b27266897cd64cf31'
  '1bfdc8af0663d18abcda427995198bd1948bb85c3b05f1e769a02530d70e0858d3a5d2d5d1d21294bb8a7a68cac023ca6f8ee13440fabc79dcb40dde8761ee56'
  '11a01156c7732bb3c5f98fecb87dba9d2abb76bd8aa18f9b51ed6cb7960163eae9977ec28933e1f53393ce642fd443541eba27d8a3dfc48df021c0fd70f7e230'
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
