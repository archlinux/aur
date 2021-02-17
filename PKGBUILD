# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_credit_limit
_name=trytond_account_credit_limit
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for account credit limit"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('039485499ae59f6a9e4f23fccfdea173a9d4265c9b52b4dc07f46ffd47fb6b6c')
sha512sums=('2f170a7b70de8bdb7bebf48207bb6a798ef3e3172e57c14066ac70b7a569571bf9fc6744e56043300d13c4c5fa2108382bda150bda00e3a74ff423647037abc8')
b2sums=('c2b562146c8d25f0b74537790d5342fa478f218578c61188a56b766e900cd44e9ce4c3b5aff344b23ffeec595a43496d14d614ebcfb5369a700788b4c0032597')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
