# Maintainer: Brian Thompson <brianrobt@pm.me>
# Contributor: leux08 <contato@leux08.dev.br>

pkgname=pixieditor-bin
_pkgname=pixieditor
pkgver=2.0.1.18
pkgrel=1
pkgdesc="Universal 2D Graphics Editor"
arch=('x86_64')
url="https://pixieditor.net"
license=('LGPL-3.0-only')
depends=(
  'fontconfig'
  'gcc-libs'
  'glibc'
  'libxcursor'
  'zlib'
)
source=("https://github.com/PixiEditor/PixiEditor/releases/download/$pkgver/PixiEditor-$pkgver-amd64-linux.tar.gz")
sha256sums=('7a4749974440e20243044cf41de1c14deffbac575d119e25b96bf8fbd9ae27b1')

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
