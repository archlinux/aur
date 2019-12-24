# Maintainer: Whyme Lyu <callme5long@gmail.com>
pkgname=p3wm
pkgver=0.4.0
pkgrel=1
pkgdesc="Three-way merge .pacnew files"
arch=('any')
url="https://github.com/5long/p3wm"
license=('custom:ISC')
depends=(
  'bash'
  'coreutils'
  'diffutils'
  'gawk'
  'pacman'
  'sed'
  'tar'
)
optdepends=(
  'git: default merge tool'
  'rcs: default merge tool'
  'kdiff3: default resolve tool'
  'meld: default resolve tool'
  'vim: default resolve tool'
)
makedepends=('git' 'asciidoctor')
source=("https://github.com/5long/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8331a98a59ebb1d46b4e48d60dab9425e84bcd259f0d81e4f9d9cb0c4770168c')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}
