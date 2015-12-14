# Maintainer: Techmeology <techmeology@techmeology.co.uk>
# Based on python2-miniupnpc AUR package

pkgname=python-miniupnpc
pkgver=1.9
pkgrel=1
pkgdesc="Repack of the original miniupnp project to facilitate install via PyPi"
arch=('i686' 'x86_64')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/chenhouwu/miniupnpc"
license=('custom')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/m/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('396f0e9a694582e422d2f140ae9781d2')
sha256sums=('498b35c5443e8de566f3a4de4bceae28fbf6e08ed59afb5ffd516d0bb718bca6')

prepare(){
  cd $srcdir/${pkgname#python-}-$pkgver

  msg 'Fixing Python version...'
}

build() {
  cd $srcdir/${pkgname#python-}-$pkgver

  msg 'Building...'
  python setup.py build
}

package() {
  cd $srcdir/${pkgname#python-}-$pkgver

  msg 'Installing license...'
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/python-miniupnpc/LICENSE

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
