# Maintainer: Thomas Letan <lthms@soap.coffee>

pkgname=octez-node-20
pkgver=0_rc1
pkgrel=1
pkgdesc='Unofficial binary release for the octez-node from Octez 20'
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
  "$pkgname-$pkgver-$pkgrel::https://gitlab.com/tezos/tezos/-/package_files/121917448/download"
  "$pkgname.sysusers"
  "$pkgname.tmpfiles"
  "$pkgname@.service"
)
sha512sums=(
  'c1bf3f24386beb683b63e338db58c48abb66477f49e3db0c86c0602a6e24c569ff675bc2260c82a986151bbae7c4b68b7b68e7d1acd6ba69ed1e8e768db69bdc'
  '4c7f574d08436ac8e5acbfc47a5a895c0401b44e96391bf6489fe80174e04982a6fd618a45db47c4994f30d3db95827417d849b98f02cb9b27266897cd64cf31'
  '1bfdc8af0663d18abcda427995198bd1948bb85c3b05f1e769a02530d70e0858d3a5d2d5d1d21294bb8a7a68cac023ca6f8ee13440fabc79dcb40dde8761ee56'
  'ad10c738d5b38f7a3d099fb5a53afed7b1ee1f3ff68b21cd23816c09a08da1b22a497ae5ff739b0b106cff5a075e7114e51dbdf95642c0eef1bd1d8064dd070a'
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
