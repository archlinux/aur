# Maintainer: raininja <daniel.mclellan@gmail.com
pkgname=modoboa
pkgver=1.3.4
pkgrel=2
pkgdesc="Modoboa is a django mail hosting and management platform"
arch=(any)
url="www.modoboa.org"
license=('GPL')
makedepends=('python2' 'python2-rrdtool' 'python2-lxml' 'python2-setuptools' 'zlib' 'python2-django' 'python2-dj-database-url'
				  'python2-pip' 'python2-requests' 'python2-crypto' 'python2-sievelib' 'python2-chardet' 'python2-argparse' 'python2-django-reversion')
optdepends=('python2-virtualenv' 'mysql' 'postgresql' 'sqlite' 'python2-mysql-connector' 'python2-psycopg2' 'python2-aspw'
			     'python2-gunicorn')
provides=('modoboa')
conflicts=('modoboa-git')
source=("https://pypi.python.org/packages/source/m/$pkgname/$pkgname-$pkgver.tar.gz" 
		   'shebang.patch')
sha512sums=('9aecea8e0c8282292ba1cc11749956967ceb66332157267338bf08a05ffdc13bfeae64968cffb3df955ee7d73ad25a9370e639c363fe6de4167044de40413e6b'
			      'bffd4074211a6468eef8a1e374786af196b27f1140fdc90d77eb2fde626178b0f91aecc7d42c2baaf9e50570bd81b4fa8f724e8e2dd05e5fa70db238e8e77de1')
prepare() {
  cd "$srcdir"
  patch -p0 -i "$srcdir/shebang.patch"
 }
package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
