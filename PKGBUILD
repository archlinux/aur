# Maintainer: raininja <daniel.mclellan@gmail.com

pkgname=modoboa
pkgver=1.3.4
pkgrel=3
pkgdesc="Modoboa is a django mail hosting and management platform"
arch=(any)
url="https://modoboa.org/en/"
license=('MIT')
makedepends=('python2' 'python2-rrdtool' 'python2-lxml' 'python2-setuptools' 'zlib')
depends=( 'python2-django' 'python2-dj-database-url' 'python2-pip' 'python2-requests' 'python2-crypto'
		       'python2-sievelib' 'python2-chardet' 'python2-argparse' 'python2-django-reversion'
		       'python2-passlib' 'python2-django-versionfield2' 'python2-factory_boy'
		       'python2-django-xforwardedfor-middleware')
optdepends=('python2-virtualenv' 'mysql' 'postgresql' 'sqlite' 'python2-mysql-connector' 'python2-psycopg2' 'python2-aspw'
			     'python2-gunicorn' 'python2-vex')
provides=('modoboa')
conflicts=('modoboa-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
		   'python2.patch')
sha512sums=('9aecea8e0c8282292ba1cc11749956967ceb66332157267338bf08a05ffdc13bfeae64968cffb3df955ee7d73ad25a9370e639c363fe6de4167044de40413e6b'
			      'a70429bd59ccf77384feff700df95facd9f7b674d0378d872233136a6ba5c61acdc6614b35493eecdfc01ae0fede12171aa143e493a45441aa87667e93903cfb')

prepare() {
  cd "$srcdir"
  patch -p0 -i "$srcdir/python2.patch"
 }
package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
