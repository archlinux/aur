# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=lite-xl-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="A lightweight text editor written in Lua"
arch=("x86_64")
url="https://github.com/lite-xl/lite-xl"
license=("MIT License")
provides=("lite-xl")
conflicts=("lite-xl" "lite-xl-git")
source=(
  "lite-xl-$pkgver.tar.gz::$url/releases/download/v${pkgver}/lite-xl-v${pkgver}-addons-linux-x86_64-portable.tar.gz"
  "data.tar.xz"
)
sha256sums=(
  '2975b8a4ba39717517a6ba0a394634e37ef32bd354409ea30afb8c00e6f51512'
  'd2a864dc6c4979ad6ed1cdda45069404bb4da095fe2e316f36d846f065b0571a'
)

package() {
  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/usr/bin"

  mv share "${pkgdir}/usr"
  mv lite-xl "${pkgdir}/opt"

  ln -sf "/opt/lite-xl/lite-xl" "$pkgdir/usr/bin/lite-xl"
}
