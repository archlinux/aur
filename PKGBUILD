# Maintainer: Pig Fang <g-plane@hotmail.com>
pkgname=icd
pkgver=0.2.0
pkgrel=3
pkgdesc='Powerful `cd` command with fuzzy-search tool.'

arch=('any')
url="https://github.com/g-plane/$pkgname"
source=("https://github.com/g-plane/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ffe97aa6ea1e73901934e726b927d63331a7e846a3bb32dea0791505af37e802')
license=('MIT')
depends=('fzf')
optdepends=('ripgrep' 'grep')

package() {
  cd $srcdir/$pkgname-$pkgver/

  install -Dm644 $pkgname.plugin.zsh $pkgdir/usr/share/zsh/scripts/$pkgname/$pkgname.plugin.zsh
  install -dm755 $pkgdir/usr/share/fish/vendor_functions.d
  install -Dm644 icd.fish $pkgdir/usr/share/fish/vendor_functions.d/icd.fish
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
