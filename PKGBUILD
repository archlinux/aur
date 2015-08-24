# Maintainer: raininja <daniel.mclellan@gmail.com

pkgname=modoboa
pkgver=1.3.4
pkgrel=3
pkgdesc="Modoboa is a django mail hosting and management platform"
arch=(any)
url="www.modoboa.org"
license=('MIT')
makedepends=('python2' 'python2-rrdtool' 'python2-lxml' 'python2-setuptools' 'zlib')
depends=( 'python2-django' 'python2-dj-database-url' 'python2-pip' 'python2-requests' 'python2-crypto'
		       'python2-sievelib' 'python2-chardet' 'python2-argparse' 'python2-django-reversion')
optdepends=('python2-virtualenv' 'mysql' 'postgresql' 'sqlite' 'python2-mysql-connector' 'python2-psycopg2' 'python2-aspw'
			     'python2-gunicorn' 'python2-vex')
provides=('modoboa')
conflicts=('modoboa-git')
source=("https://pypi.python.org/packages/source/m/$pkgname/$pkgname-$pkgver.tar.gz" 
		   'python2.patch')
sha512sums=('9aecea8e0c8282292ba1cc11749956967ceb66332157267338bf08a05ffdc13bfeae64968cffb3df955ee7d73ad25a9370e639c363fe6de4167044de40413e6b'
			      'b7a26db760633acbc6104af1d63c8df1cb5b7b806654d64129d65f7129d715e8abf6997e2ca5b0090a8319f6059beb82ac600ed1a392eb7fc7df6a6e81157e7a')

prepare() {
  cd "$srcdir"
  patch -p0 -i "$srcdir/python2.patch"
 }
package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
