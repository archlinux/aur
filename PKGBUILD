# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=percol
pkgver=0.2.1
_commit=4b28037e328da3d0fe8165c11b800cbaddcb525e
pkgrel=4
pkgdesc="Adds flavor of interactive filtering to the traditional pipe concept of UNIX shell"
arch=('any')
depends=('python-six')
makedepends=('python-setuptools')
optdepends=('python-cmigemo: for migemo support')
url="https://github.com/mooz/percol"
license=('MIT')
source=("https://github.com/mooz/percol/archive/$_commit.zip")
sha256sums=('38c2bec72fb863181578768d9cd3f3ed3dd98156af2b0095afa2371b65c0dc8c')

build() {
  cd $pkgname-$_commit
  python setup.py build
}

package() {
  cd $pkgname-$_commit
  python setup.py install --root="$pkgdir" --optimize=1
}
