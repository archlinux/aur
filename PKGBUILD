# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=lite-xl-bin
pkgver=2.1.3
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
  'cfa8b69aa58017aca6fd106c81ad368b2ffd342c01cc58f80bb012cb096a125f'
  'd2a864dc6c4979ad6ed1cdda45069404bb4da095fe2e316f36d846f065b0571a'
)

package() {
  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/usr/bin"

  mv share "${pkgdir}/usr"
  mv lite-xl "${pkgdir}/opt"

  ln -sf "/opt/lite-xl/lite-xl" "$pkgdir/usr/bin/lite-xl"
}
