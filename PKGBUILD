# Maintainer: Whyme Lyu <callme5long@gmail.com>
pkgname=p3wm
pkgver=0.7.1
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
sha256sums=('e7d1d6fdf41e3022fb045f9ad6bc17f0b507a9e24c308e6102b64f6e556ce669')
