# Maintainer: Thomas Letan <lthms@soap.coffee>

pkgname=octez-smart-rollup-node
pkgver=21.1
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
  "$pkgname-$pkgver-$pkgrel::https://gitlab.com/tezos/tezos/-/package_files/166086127/download"
  "$pkgname.sysusers"
  "$pkgname.tmpfiles"
  "$pkgname@.service"
)
sha512sums=('457351404356c0d3bd60d175ee512d92526372fcd45a57f6ad201d8d7f87ee71d700f26faf1af8a36aa5289e6bad6d451949abd80909d8df38dcea2661489052'
            '4c7f574d08436ac8e5acbfc47a5a895c0401b44e96391bf6489fe80174e04982a6fd618a45db47c4994f30d3db95827417d849b98f02cb9b27266897cd64cf31'
            '1bfdc8af0663d18abcda427995198bd1948bb85c3b05f1e769a02530d70e0858d3a5d2d5d1d21294bb8a7a68cac023ca6f8ee13440fabc79dcb40dde8761ee56'
            'de32035f38db05580a2d77848a79905e49aa1d3d8864647f1098568c9ae02aef80c6bc120c09965f09ef4ce840d88f21fcd46ab1101b93e9893eb696020ea6c6')

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
