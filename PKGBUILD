# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=goldtree-py
_githubver=0.5
pkgver="$_githubver.0"
pkgrel=1
pkgdesc="A python port of XorTroll's Goldtree"
arch=('any')
url='https://github.com/friedkeenan/GoldtreePy'
license=('GPL3')
depends=('python'
         'python-pyusb')
source=("https://github.com/friedkeenan/GoldtreePy/archive/v$_githubver.tar.gz")
sha256sums=('de22ead073629662f22333dbfcb904227cd051986e5f38f49275e3311a4ebf1f')

package() {
  cd "GoldtreePy-$_githubver"
  install -t "$pkgdir/usr/lib/$pkgname" -Dm644 PFS0.py
  install -t "$pkgdir/usr/lib/$pkgname" -Dm755 Goldtree.py
  install -t "$pkgdir/usr/share/licenses/$pkgname" -Dm644 LICENSE
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/Goldtree.py" "$pkgdir/usr/bin/$pkgname"
}
