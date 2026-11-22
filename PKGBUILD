# Maintainer: Coobyk <mail@coobyk.com>
pkgname=oblyx-bin
pkgver=0.1.0.r74
pkgrel=1
pkgdesc="Convert GoodNotes notebooks to SVG, PDF, PNG, and Notability .ntb (CLI, prebuilt binary)"
arch=('x86_64')
url="https://github.com/Coobyk/oblyx"
license=('MIT')
depends=('gcc-libs')
optdepends=('poppler: rasterize PDF page backgrounds for SVG/PNG output'
            'oblyx-gui-bin: graphical interface')
provides=('oblyx')
conflicts=('oblyx')
source=("oblyx-linux-x64-$pkgver.tar.gz::https://github.com/Coobyk/oblyx/releases/download/v$pkgver/oblyx-$pkgver-linux-x64.tar.gz")
sha256sums=(''e03a2d020b6e2c75197c5bd9327c5a61e601766f3fdf41a12176f7d3dca7a4f9'')

package() {
  cd "oblyx-$pkgver-linux-x64"
  install -Dm755 oblyx "$pkgdir/usr/bin/oblyx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
