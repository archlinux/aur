# Maintainer: nekgem2 <nekgem2@firemail.cc>
pkgname=zcash-bin
pkgver=6.1.0
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
sha512sums=('03a2f862958517955957751554a2fdc6eecafa9e02dfcbd8278d0e07ba10f118bcdd5bfb019be3cd6238f5529695f679f25619618df0aec1b4676944b1943cbb'
            '2fb8b0a636ca9c7ee15f0fd2c47046c8323ade3de9562f393da7541eee50dd14b12107dd29b0e1ee90ff88963e2f7e25b12435166a1812df5c88c579c12dde88')

prepare() {
  tar xf data.tar.xz
}

package() {
  install -d "$pkgdir/usr"
  cp -r "usr/"* "$pkgdir/usr/"
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" zcashd.service
}
