# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_company_work_time
_name=trytond_company_work_time
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add work time on company"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4eaaea7b960d76816bbfb3906375f79e84505bced93f553fb7388dba646a84fb')
sha512sums=('a68c2ec1c63beb5256ed3c8b1f380ee3491346f5af047f82c6325d9cf153c06aff78475d254276a81250d090b0385a9114183ab886f5bf47f4660fbe5e65d40a')
b2sums=('5cf34d876d341d315592eccfc241acef2a5af2ae55674a90d6850e88b9ff8e9abaab6e85ffe24167be3e7b20453791a2b3b71c4ce766927f99ae93600253b23f')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
