# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Kozec <kozec at kozec dot com>

pkgname=pymclevel
pkgver=0.1.8build799
pkgrel=2
pkgdesc="Python library for reading Minecraft levels"
arch=('i686' 'x86_64')
url="https://github.com/mcedit/pymclevel"
license=('ISC')
_commit="8bf7b3d76479e007a51f3055198a8bcddb626c84"
depends=('python2' 'python2-numpy' 'python2-yaml' 'python2-distribute')
makedepends=('cython2' 'unzip')
conflicts=('pymclevel-git')
provides=('pymclevel-git')
source=("$pkgname-$pkgver.zip::https://github.com/mcedit/pymclevel/archive/${_commit}.zip")
sha512sums=('c7c1c9d2e2ac54555a09df845d21cdf885fae907c559986b1998dda50b6c039f368efa2dc0f3a7eff7646ae95571f93bb36e9ff1b8d380706aefbd011ab56d02')

build() {
  cd $srcdir/$pkgname-$_commit
  python2 setup.py build
}


package() {
  cd $srcdir/$pkgname-$_commit
  target="$pkgdir/usr/lib/python2.7/site-packages/pymclevel"
  python2 setup.py install --root="${pkgdir}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp *.yaml "$target"
}
