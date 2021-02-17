# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_dunning
_name=trytond_account_dunning
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for account dunning"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('29b92eb3cf77ad96f4a91166807d3e5d47a6a6549a1a11ad9549599c159b54aa')
sha512sums=('c47b7575556c960adcf8e8512e7d46b27af55258d8759b4375f3bb1a0a750282d4b58bbd2c0aa20c3b9f61125efd6a98969ae7e4cea68ea2a532ac90580abcb6')
b2sums=('b1e2893bf4082519286f74452b6ead4d8685076b7229bb15abe15a82f2bca47ad1cc36155bd9d54c5349e9e20a5488f9faf0caf4e6c5b21235ca8ab082576435')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
