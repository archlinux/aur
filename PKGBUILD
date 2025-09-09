# Maintainer: Brian Thompson <brianrobt@pm.me>
# Contributor: leux08 <contato@leux08.dev.br>

pkgname=pixieditor-bin
_pkgname=pixieditor
pkgver=2.0.1.13
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
sha512sums=('15ce13d257c85dea066e6f63ce17cf0adf1979701776d3aba2e730bfd64ff9597a9b954f957d48d0ddee55b6729523a74837b6d69169e2e7ffeca031c3067d93')

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