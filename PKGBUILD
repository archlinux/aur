# Maintainer: Pig Fang <g-plane@hotmail.com>
pkgname=icd
pkgver=0.2.0
pkgrel=2
pkgdesc='Powerful `cd` command with fuzzy-search tool.'

arch=('any')
url="https://github.com/g-plane/$pkgname"
source=("https://github.com/g-plane/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
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
