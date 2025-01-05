# Maintainer: Thomas Letan <lthms@soap.coffee>

pkgname=octez-node
pkgver=21.1
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
  "$pkgname-$pkgver-$pkgrel::https://gitlab.com/tezos/tezos/-/package_files/166086660/download"
  "$pkgname.sysusers"
  "$pkgname.tmpfiles"
  "$pkgname@.service"
)
sha512sums=('6ff9fbdd4d930891098b8aba5f2d8079df95f7f43468c18d00679233356c1eb34c04dced0ed52f9cd93f9b8ae03d93f9015ac6590846187221e3a549aa38821a'
            '4c7f574d08436ac8e5acbfc47a5a895c0401b44e96391bf6489fe80174e04982a6fd618a45db47c4994f30d3db95827417d849b98f02cb9b27266897cd64cf31'
            '1bfdc8af0663d18abcda427995198bd1948bb85c3b05f1e769a02530d70e0858d3a5d2d5d1d21294bb8a7a68cac023ca6f8ee13440fabc79dcb40dde8761ee56'
            '685200e0f7f7a8aaffa0b92181b7f5d6619c025bf887d9cada3bb582925ecac4af766bbc3693197203439e775b77e09c220117d0142e13030867913e92f2d90a')

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
