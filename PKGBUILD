# Maintainer: Hikari Hayashi <rev.hikari@gmail.com>

pkgname=plymouth-theme-neat
pkgver=0.1.0
pkgrel=1
pkgdesc="HiDPI-Friendly Plymouth Theme for Arch Linux"
url="https://github.com/neetly/plymouth-theme-neat"
license=(MIT)
arch=(any)
depends=(plymouth)
makedepends=(git)
source=("$pkgname::git+https://github.com/neetly/plymouth-theme-neat.git#tag=v$pkgver")
cksums=(SKIP)

package() {
  cd "$srcdir/$pkgname"
  (
    cd ./src
    find . -exec install -Dm644 "{}" "$pkgdir/usr/share/plymouth/themes/neat/{}" \;
  )
  install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/plymouth-theme-neat/LICENSE"
}
