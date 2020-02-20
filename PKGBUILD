# Maintainer: Trivernis <trivernis@gmail.com>

pkgname=cryptpng
pkgver=1.0
pkgrel=2
pkgdesc='A tool for encrypting and decrypting data inside a png file.'
arch=(x86_64)
url=https://github.com/Trivernis/cryptpng
license=(MIT)
depends=()
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/cryptpng/archive/v$pkgver.zip)
sha512sums=(8a726d44621617c79a36f0e8da502065d6534de8b74eb8b7d42abc80556715f14035cf35af905a70b05bcf82651a8677199b78e3dc3981293f8fa3fcb6a3f900)

prepare() {
  cd $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver
  go build
}

package() {
  install -d "$pkgdir"/usr/{lib,bin}
  cp -a cryptpng-$pkgver "$pkgdir"/usr/lib/cryptpng
  ln -s /usr/lib/cryptpng/cryptpng "$pkgdir"/usr/bin
}
