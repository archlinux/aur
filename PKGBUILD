# Maintainer: raininja <daniel.mclellan@gmail.com

pkgname=modoboa
pkgver=1.17.0
pkgrel=4
pkgdesc="Mail hosting made simple"
arch=(any)
url="https://modoboa.org/"
license=('MIT')
makedepends=('python' 'rrdtool' 'python-lxml' 'python-setuptools' 'zlib' 'python-wheel')
depends=('python-django' 'python-dj-database-url' 'python-pip' 'python-requests' 'python-crypto'
         'python-chardet' 'python-argparse' 'python-django-reversion'
         'python-passlib' 'python-django-versionfield2' 'python-factory_boy'
         'python-django-xforwardedfor-middleware')
optdepends=('python-virtualenv' 'mysql' 'postgresql' 'sqlite' 'python-mysql-connector' 'python-psycopg2' 'gunicorn' 'python-vex')
provides=('modoboa')
conflicts=('modoboa-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e7fc609605a0a6503a47656bc9ca564c83bc46f44acfc793b01e926053b2b0fa585cedfd9c5bb1f654cf02534e7d006bec66076daf696372fde203f9a9d74e20')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
