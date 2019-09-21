# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=goldtree-py
_githubver=0.7
pkgver="$_githubver.0"
pkgrel=1
pkgdesc="A python port of XorTroll's Goldtree"
arch=('any')
url='https://github.com/friedkeenan/GoldtreePy'
license=('GPL3')
depends=('python'
         'python-pyusb')
source=("https://github.com/friedkeenan/GoldtreePy/archive/v$_githubver.tar.gz")
sha256sums=('0422ead54edb41314c2c13d6cc4b14219cfcf0ea5b2f81aefa99919710ab2205')

package() {
  cd "GoldtreePy-$_githubver"
  install -t "$pkgdir/usr/lib/$pkgname" -Dm755 Goldtree.py
  install -t "$pkgdir/usr/share/licenses/$pkgname" -Dm644 LICENSE
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/Goldtree.py" "$pkgdir/usr/bin/$pkgname"
}
