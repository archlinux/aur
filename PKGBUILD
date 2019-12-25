# Maintainer: Whyme Lyu <callme5long@gmail.com>
pkgname=p3wm
pkgver=0.5.0
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
sha256sums=('a8de4df0bfab92013fb2af041eb1e49bb43bbbbca3632d3004cef91d77360d27')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}
