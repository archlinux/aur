# Maintainer: Luke Wilkinson <wilkinsonluke@proton.me>

pkgname=fmp-bin
pkgver=1.4.4
pkgrel=1
pkgdesc="A simple secure password manager written in rust."
arch=('x86_64')
url="https://github.com/lwilk0/fmp"
conflicts=('fmp-git')
license=('GPL-3.0')
depends=('gpgme' 'libgpg-error')
makedepends=('curl')
source=("fmp-linux::https://github.com/lwilk0/fmp/releases/download/v${pkgver}/fmp-linux")
sha512sums=('a19fb26ea45a6fbd8936cb903b01b025b73d6e1929e92777d41fd1dbb680a7245a108379724b0222c52256011dd2045ce18a7d22f2853e74d09162f8834eac85')

build() {
  curl -fsSL https://github.com/lwilk0/fmp/blob/main/LICENSE > LICENSE
  curl -fsSL https://github.com/lwilk0/fmp/blob/main/README.md > README.md
}
package() {
  install -Dm755 "fmp-linux" "$pkgdir/usr/bin/fmp"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
