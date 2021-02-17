# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_carrier
_name=trytond_carrier
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module with carriers"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a91cbec366184b3e26fcde98ebdbc975d418c8633d02e065484862952c968392')
sha512sums=('7dd2d24f5db26f2878eb2e15746055e02d1d1569313905086c0f248c50153eb6cfb19fbd3252a1add815ce2b9879036cadf8619fa30d17c5d16d622f2532b9a3')
b2sums=('ff83681d4434b097ffa1052996d68029e5335ad3683bedc38adb1a2b74eb9fdd547821397a5fb0a3cd42edcca10df35f3002b5ad2fa647e16a682245aa0af377')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
