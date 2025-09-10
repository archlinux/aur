# Maintainer: Brian Thompson <brianrobt@pm.me>
# Contributor: leux08 <contato@leux08.dev.br>

pkgname=pixieditor-bin
_pkgname=pixieditor
pkgver=2.0.1.14
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
sha512sums=('fe7eee6e87d9367d5196fcc64fe7231ed584fe664d3c409cd5e83e8060642c66c0a373d553370d1edb56fc82633aaf48d303f25beb30a4bc39b2838d91bef79b')

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