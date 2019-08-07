# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=goldtree-py
_githubver=0.6.1
pkgver="$_githubver"
pkgrel=1
pkgdesc="A python port of XorTroll's Goldtree"
arch=('any')
url='https://github.com/friedkeenan/GoldtreePy'
license=('GPL3')
depends=('python'
         'python-pyusb')
source=("https://github.com/friedkeenan/GoldtreePy/archive/v$_githubver.tar.gz")
sha256sums=('1e82c5ae2f804dbd00a79102210f37815567a68035e7fbeb7c4712b5286bdb0a')

package() {
  cd "GoldtreePy-$_githubver"
  install -t "$pkgdir/usr/lib/$pkgname" -Dm755 Goldtree.py
  install -t "$pkgdir/usr/share/licenses/$pkgname" -Dm644 LICENSE
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/Goldtree.py" "$pkgdir/usr/bin/$pkgname"
}
