# Maintainer: Whyme Lyu <callme5long@gmail.com>
pkgname=p3wm
pkgver=0.6.3
pkgrel=2
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/5long/$pkgname/archive/v$pkgver.tar.gz")
build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}

# Put checksum at the end so we can update it easier w/ `makepkg -g >> PKGBUILD`
sha256sums=('db5cf7bf04b6a7a66a62a545ab0692c71ba293c6dc5d24cba5e84b4906f6a779')
