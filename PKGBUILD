# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=iblocklist2ipset
pkgver=0.0.1
pkgrel=1
pkgdesc="Convert P2P lists from IBlocklist.com to IPSet compatile format"
arch=(any)
url="https://github.com/9seconds/iblocklist2ipset"
license=('MIT')
depends=('python-docopt' 'python-netaddr' 'python-requests' 'python-six')
source=("https://github.com/9seconds/iblocklist2ipset/archive/$pkgver.tar.gz")
md5sums=('fe0ec2cdd98e1a5c1688478fad08c1a2')
sha256sums=('931fc1e1fd122831a971f5cd2a0b6278dc3d99e64ef25506ba18626b7e20de7d')

prepare() {
  cd "$pkgname-$pkgver"
  for f in requirements.txt setup.py; do
    sed -i 's/\([a-z]\{1,\}\)==\([0-9]\{1,\}\)/\1>=\2/g' "$f"
  done
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O2
}
