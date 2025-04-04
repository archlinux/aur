# Maintainer: Jakub Smolaga <smolagakuba@gmail.com>
pkgname=sdf_mono_atlas
pkgver=1.0.0
pkgrel=1
pkgdesc="Tool for generating a monospaced ASCII SDF atlas"
arch=('x86_64')
url="https://github.com/jakubsmolaga/sdf_mono_atlas"
license=('Unlicense')
depends=()
makedepends=('clang' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c170436e55e8c0d19f61b00c50be1384793b45ec1358a8e99dac9705830d3dab')

build() {
  cd "$pkgname-$pkgver"
  make sdf_mono_atlas
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 sdf_mono_atlas "$pkgdir/usr/bin/sdf_mono_atlas"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 readme.md "$pkgdir/usr/share/doc/$pkgname/readme.md"
}
