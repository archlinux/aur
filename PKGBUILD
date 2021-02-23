# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_payment_stripe
_name=trytond_account_payment_stripe
pkgver=5.8.2
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for Stripe payment"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('685bf897e03fbddbbe5e4ba423ff06221ac07628f4089c5eca6f2b9c3ec22ef7')
sha512sums=('85055b76af533c61f0d940ec219be99c072c52cc90128ebf634a0f194171b076960971615a1c8439c99ce4611eaa0f911cce76c5d72b2de6ff916ca82a2e1419')
b2sums=('7c161e29b7a76cedd7d5435318d923e9a10cad54b7c28a985686b7cd81989d1e65fd4dc779f513cc5eba12fb5c8d444793d0eff7235cee8e325715e143e76f8e')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
