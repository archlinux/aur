# Maintainer: Luke Wilkinson <wilkinsonluke@proton.me>

pkgname=fmp-bin
pkgver=1.4.3
pkgrel=1
pkgdesc="A simple secure password manager written in rust."
arch=('x86_64')
url="https://github.com/lwilk0/fmp"
conflicts=('fmp-git')
license=('GPL-3.0')
depends=('gpgme' 'libgpg-error')
makedepends=('cargo')
source=("fmp-linux::https://github.com/lwilk0/fmp/releases/download/v${pkgver}/fmp-linux")
sha512sums=('2015f92b48d4b7ee6ca7926b020bbbfc021292251273b0b387b9f9939fc94a473e236fe1f2cbd42226851613d20403352fc4011a2687d202bc615f1646c4785f')

build() {
  curl -fsSL https://github.com/lwilk0/fmp/blob/main/LICENSE > LICENSE
  curl -fsSL https://github.com/lwilk0/fmp/blob/main/README.md > README.md
}
package() {
  install -Dm755 "fmp-linux" "$pkgdir/usr/bin/fmp"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
