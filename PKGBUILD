# Maintainer: Sanavi Sonwane <sanvi.harnale@gmail.com>
pkgname='clipyank' # '-bzr', '-git', '-hg' or '-svn'
pkgver=1.1.0
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
sha256sums=('a4acb01f0e87e03014880a4f33c5432cff61664f55d0acf2b92bbf450880b4bc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install
}