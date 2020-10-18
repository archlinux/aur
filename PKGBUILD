# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=goldtree-py
_githubver=0.9
pkgver="$_githubver.0"
pkgrel=1
pkgdesc="A python port of XorTroll's Goldtree"
arch=('any')
url='https://github.com/friedkeenan/GoldtreePy'
license=('GPL3')
depends=('python'
         'python-pyusb')
source=("https://github.com/friedkeenan/GoldtreePy/archive/v$_githubver.tar.gz")
sha256sums=('56755c6f6ac9bf2979ccab5bd053796b53b19fc5a74c412db5dcaad23bb00588')

package() {
  cd "GoldtreePy-$_githubver"
  install -t "$pkgdir/usr/lib/$pkgname" -Dm755 Goldtree.py
  install -t "$pkgdir/usr/share/licenses/$pkgname" -Dm644 LICENSE
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/Goldtree.py" "$pkgdir/usr/bin/$pkgname"
}
