# Maintainer: Chris Zhang <develop@zcy.moe>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=shader-slang-bin
pkgver=2024.14.4
pkgrel=1
pkgdesc='Shading language that makes it easier to build and maintain large shader codebases in a modular and extensible fashion'
url='https://github.com/shader-slang/slang'
arch=('x86_64')
license=('MIT')
source=("$url/releases/download/v$pkgver/slang-$pkgver-linux-$CARCH.tar.gz")
sha256sums=('025e6be9fc0277021b9ea559b8a7f7f47b6fa843671203284cbecc8d1a50610f')
depends=(glslang)
conflicts=(shader-slang shader-slang-git)
provides=(shader-slang)

package() {
  mkdir -p $pkgdir/opt/shader-slang-bin/{bin,lib,include/shader-slang,share/{,licenses/}shader-slang}
  mv bin/{slangc,slangd,gfx.slang,slang.slang} $pkgdir/opt/shader-slang-bin/bin/
  mv lib/*.so $pkgdir/opt/shader-slang-bin/lib/
  mv include/*.h $pkgdir/opt/shader-slang-bin/include/shader-slang/
  mv share/doc $pkgdir/opt/shader-slang-bin/share/shader-slang/doc
  mv LICENSE $pkgdir/opt/shader-slang-bin/share/licenses/shader-slang/
}
