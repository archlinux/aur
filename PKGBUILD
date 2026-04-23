# Maintainer: Brian Thompson <brianrobt@pm.me>
# Contributor: leux08 <contato@leux08.dev.br>

pkgname=pixieditor-bin
_pkgname=pixieditor
pkgver=2.1.0.22
pkgrel=1
pkgdesc="Universal 2D Graphics Editor"
arch=('x86_64')
url="https://pixieditor.net"
license=('LGPL-3.0-only')
provides=("pixieditor")
conflicts=("pixieditor")
depends=(
  'fontconfig'
  'gcc-libs'
  'glibc'
  'libxcursor'
  'zlib'
)
source=("https://github.com/PixiEditor/PixiEditor/releases/download/$pkgver/PixiEditor-$pkgver-amd64-linux.tar.gz")
sha256sums=('747d92a02d6056db76c7be66215c0f1cee543686e8571cb47bdad1b27de267f9')

package() {
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/usr/share/pixmaps
  mkdir -p "$pkgdir"/opt

  cp -r . "$pkgdir"/opt/$pkgname

  install -m755 ../$_pkgname.sh "$pkgdir"/usr/bin/$_pkgname

  install -m644 ../*.desktop "$pkgdir"/usr/share/applications/

  install -m644 ./Assets/PixiEditorLogo.png "$pkgdir"/usr/share/pixmaps/pixieditor.png
}
