_pipname=SQLAlchemy-Continuum
pkgbase=python-sqlalchemy-continuum
pkgname=('python2-sqlalchemy-continuum' 'python-sqlalchemy-continuum')
pkgver=1.3.6
pkgrel=1
pkgdesc="Versioning and auditing extension for SQLAlchemy"
arch=(any)
url="https://github.com/kvesteri/sqlalchemy-continuum"
license=(BSD)
makedepends=(python2-setuptools python-setuptools)
checkdepends=(python-pytest python-flexmock python-psycopg2 python-mysql-connector python-six python-flask-sqlalchemy python-flask-login)
source=("https://pypi.io/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('969258e409678d734b4ec12b4e31eca5d4543c75e0d5b3a265f07eefb2adc02d')

package_python2-sqlalchemy-continuum() {
  depends=(python2-sqlalchemy python2-sqlalchemy-utils)
  cd $_pipname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname

}

package_python-sqlalchemy-continuum() {
  depends=(python-sqlalchemy python-sqlalchemy-utils)
  cd $_pipname-$pkgver 
  python setup.py install --root="$pkgdir" --optimize=1

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

check() {
  cd "$_pipname-$pkgver/tests"
  # missing sqlalchemy_i18n
  #pytest .
}
