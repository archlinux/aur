# Maintainer: hyak <hyakdev@gmail.com>
pkgname=axmol-bin
pkgver=2.1.1
pkgrel=3
pkgdesc="A multi-platform 2D/3D game engine, fork of Cocos2d-x (Precompiled standard SDK package)"
arch=('x86_64')
url="https://github.com/axmolengine/axmol"
license=('MIT')
depends=('glu' 'glew' 'glfw-x11' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi' 'fontconfig' 'sqlite')
provides=('axmol')
conflicts=('axmol' 'axmol-git')
source=("https://github.com/axmolengine/axmol/releases/download/v${pkgver}/axmol-${pkgver}-linux-x64.tar.gz")
sha256sums=('fb8a76d1a938be9a98e83b4b03657b29a65dbd6c7e3f9a74c76bde15d9b56f8a')

package() {
  cd "$srcdir/axmol-${pkgver}-linux-x64"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib"
  install -d "$pkgdir/usr/share/axmol"

  # Mapear el SDK precompilado al sistema
  cp -r bin/* "$pkgdir/usr/bin/" 2>/dev/null || true
  cp -r lib/* "$pkgdir/usr/lib/" 2>/dev/null || true
  cp -r * "$pkgdir/usr/share/axmol/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
