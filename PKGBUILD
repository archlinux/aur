# Maintainer: Sanavi Sonwane <sanvi.harnale@gmail.com>
pkgname='clipyank' # '-bzr', '-git', '-hg' or '-svn'
pkgver=1.0.0
pkgrel=1
pkgdesc="Track clip history for vim"
arch=('x86_64')
url="https://github.com/ISanviI/clipyank"
license=('MIT')
makedepends=('git' 'gcc')
optdepends=(
  'wl-clipboard: clipboard support on Wayland'
  'xclip: clipboard support on X11'
)
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/ISanviI/clipyank/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4ae4341d69ec23775c1763e88f715eef04ed4c4c76d5ccd87a869c8a6754ec50')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install
}