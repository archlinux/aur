# Maintainer: Pig Fang <g-plane@hotmail.com>
pkgname=icd
pkgver=0.2.0
pkgrel=1
pkgdesc='Powerful `cd` command with fuzzy-search tool.'

arch=('any')
url="https://github.com/g-plane/$pkgname"
source=("https://github.com/g-plane/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4ad64ebd0afcb99f8def17044d2255c34fd3bdf16683ff938829b64a1048fdf2')
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
