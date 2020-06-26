# Maintainer: Simon Cruanes <simon.cruanes.2007@m4x.org>
pkgname=kristall
pkgver=0.3
pkgrel=0
epoch=
pkgdesc="A high-quality visual cross-platform gemini browser."
arch=('x86_64')
url="https://github.com/MasterQ32/kristall"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'openssl' 'qt5-svg')
makedepends=()
provides=('kristall')
source=("https://github.com/MasterQ32/kristall/archive/V0.3.tar.gz")

package() {
  cd "$srcdir/kristall-$pkgver"
  make
  install -D build/kristall "$pkgdir/usr/bin/kristall"
  install -D LICENSE "$pkgdir/usr/share/licenses/kristall/LICENSE"
  cp Kristall.desktop "$HOME/.local/share/applications/kristall.desktop"
  update-desktop-database "$HOME/.local/share/applications"
}

md5sums=('40b08c53df0b445e5307ee61b5f5f05b')
