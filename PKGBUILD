# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=shader-slang-bin
pkgver=0.23.10
pkgrel=1
pkgdesc='Shading language that makes it easier to build and maintain large shader codebases in a modular and extensible fashion'
url='https://github.com/shader-slang/slang'
arch=('x86_64')
license=('MIT')
source=("$url/releases/download/v$pkgver/slang-$pkgver-linux-x86_64.tar.gz")
sha256sums=('92eca05505ec70d7b4b93d7850b96bfbabc49aa897582b629d3d24f153a8446c')
depends=(glslang)

package() {
  mkdir -p $pkgdir/usr/{bin,lib,include/shader-slang,share/{,licenses/}shader-slang}
  mv bin/linux-x64/release/slangc $pkgdir/usr/bin/
  mv bin/linux-x64/release/*.so $pkgdir/usr/lib/
  mv *.h prelude $pkgdir/usr/include/shader-slang/
  mv docs $pkgdir/usr/share/shader-slang/
  mv LICENSE $pkgdir/usr/share/licenses/shader-slang/
}
