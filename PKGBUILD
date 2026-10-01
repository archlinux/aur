pkgname=forgecode-bin
pkgver=2.14.0
pkgrel=1
pkgdesc="CLI code assistant; pre-built upstream binary"
arch=('x86_64' 'aarch64')
url="https://github.com/tailcallhq/forgecode"
license=('Apache-2.0')
provides=('forge')
conflicts=('forge')
depends=('fzf' 'bat' 'fd')
_baseurl=https://github.com/tailcallhq/forgecode/releases/download/v${pkgver}
source_x86_64=("forge::${_baseurl}/forge-x86_64-unknown-linux-gnu")
source_aarch64=("forge::${_baseurl}/forge-aarch64-unknown-linux-gnu")
source=("LICENSE")
sha256sums_x86_64=('38835a22b5820d16e3f14a2cfc0da69836868a3d0d1e76248b0e761f68d423b6')
sha256sums_aarch64=('e29803c04c7652578f98908a96be20b0ed0e7e0831d99bf4b53e37c528851773')
sha256sums=('3c9f90350449325ae2b1355d6aae26df25be58f1cfcb8ed6a44b9c4b10c663f9')

package() {
  install -Dm0755 forge "$pkgdir/usr/bin/forge"
  ln -sf forge "$pkgdir/usr/bin/forgecode"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
