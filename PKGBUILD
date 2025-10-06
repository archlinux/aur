# Maintainer: Chris Zhang <develop@zcy.moe>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=shader-slang-bin
pkgver=2025.18.1
pkgrel=1
pkgdesc='Shading language that makes it easier to build and maintain large shader codebases in a modular and extensible fashion'
url='https://github.com/shader-slang/slang'
arch=('x86_64')
license=('MIT')
source=("$url/releases/download/v$pkgver/slang-$pkgver-linux-$CARCH.tar.gz")
sha256sums=('be553e11e699608d57277ec245bcef3c72842b22ff64ee58b4888ef1157d7bbf')
depends=(glslang)
conflicts=(shader-slang shader-slang-git)
provides=(shader-slang)

package() {
  mkdir -p $pkgdir/opt/shader-slang-bin/{bin,lib,include/shader-slang,share/{,licenses/}shader-slang}
  mv bin/{slangc,slangd,slangi,gfx.slang,slang.slang} $pkgdir/opt/shader-slang-bin/bin/
  mv lib/*.so $pkgdir/opt/shader-slang-bin/lib/
  mv include/*.h $pkgdir/opt/shader-slang-bin/include/shader-slang/
  mv share/doc $pkgdir/opt/shader-slang-bin/share/shader-slang/doc
  mv LICENSE $pkgdir/opt/shader-slang-bin/share/licenses/shader-slang/
}
