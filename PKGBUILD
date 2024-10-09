# Maintainer: nekgem2 <nekgem2@firemail.cc>
pkgname=zcash-bin
pkgver=6.0.0
pkgrel=1
pkgdesc="Permissionless financial system employing zero-knowledge security (bin)"
arch=('x86_64')
url="https://z.cash/"
license=('MIT')
provides=("zcash=$pkgver")
conflicts=('zcash')
# apt-get --print-uris download zcash
source=("https://apt.z.cash/pool/main/z/zcash/zcash-${pkgver}-amd64-bookworm.deb"
        'zcashd.service')
sha512sums=('1067d30b927cce21e7e639f5f0b4c21ecf8861085e8634a13304d35edd25d8cd224dd1aac0779dfd520f51126dc57aee881edfcaa2c24a0da98d5584bf11dc6a'
            '2fb8b0a636ca9c7ee15f0fd2c47046c8323ade3de9562f393da7541eee50dd14b12107dd29b0e1ee90ff88963e2f7e25b12435166a1812df5c88c579c12dde88')

prepare() {
  tar xf data.tar.xz
}

package() {
  install -d "$pkgdir/usr"
  cp -r "usr/"* "$pkgdir/usr/"
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" zcashd.service
}
