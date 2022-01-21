# Maintainer: Roshless <pkg@roshless.com>

pkgname=python-graphene-django
_name=${pkgname#python-}
pkgver=2.15.0
pkgrel=2
pkgdesc='Graphene Django integration'
url='https://github.com/graphql-python/graphene-django'
arch=('any')
license=('MIT')
depends=('python' 'python-pip' 'python-django' 'python-graphene')
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

md5sums=('dca5a9ef3976690d724fe1975bf49fe5')
