# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=shader-slang-bin
pkgver=0.24.28
pkgrel=1
pkgdesc='Shading language that makes it easier to build and maintain large shader codebases in a modular and extensible fashion'
url='https://github.com/shader-slang/slang'
arch=('x86_64')
license=('MIT')
source=("$url/releases/download/v$pkgver/slang-$pkgver-linux-$CARCH.tar.gz")
sha256sums=('0969ba7b7639d427107d745211c5ad502dbda98b8a80cf8e80dbecf74babed90')
depends=(glslang)
conflicts=(shader-slang shader-slang-git)
provides=(shader-slang)

package() {
  mkdir -p $pkgdir/usr/{bin,lib,include/shader-slang,share/{,licenses/}shader-slang}
  mv bin/linux-x64/release/slangc $pkgdir/usr/bin/
  mv bin/linux-x64/release/*.so $pkgdir/usr/lib/
  mv *.h prelude $pkgdir/usr/include/shader-slang/
  mv docs $pkgdir/usr/share/shader-slang/
  mv LICENSE $pkgdir/usr/share/licenses/shader-slang/
}
