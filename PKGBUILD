# Maintainer: Roshless <pkg@roshless.com>

pkgname=python-django-pglocks
_name=${pkgname#python-}
pkgver=1.0.4
pkgrel=1
pkgdesc='django-pglocks provides a useful context manager to manage PostgreSQL advisory locks'
url='https://github.com/Xof/django-pglocks'
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
}

md5sums=('4907244be5a47d0bc618ae31ab68a9f9')
