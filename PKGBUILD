# Maintainer: Whyme Lyu <callme5long@gmail.com>
pkgname=p3wm
pkgver=0.3.0
pkgrel=1
pkgdesc="Three-way merge .pacnew files"
arch=('any')
url="https://github.com/5long/p3wm"
license=('custom:ISC')
depends=(
  'bash'
  'coreutils'
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
sha256sums=('6a9eada2ebb650b1a8019c898e9c7bfd6f75734915364022d420f0146dcc6dd6')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}
