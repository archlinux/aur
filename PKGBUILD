# Maintainer: Roshless <pkg@roshless.com>

pkgname=python-django-graphiql-debug-toolbar
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc='Django Debug Toolbar for GraphiQL IDE.'
url='https://github.com/flavors/django-graphiql-debug-toolbar'
arch=('any')
license=('MIT')
depends=('python' 'python-django')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

md5sums=('6f559229718b700f1007231bd90b226a')
