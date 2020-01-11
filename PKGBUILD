# Maintainer: Alessandro Righi <alerighi4@gmail.com>

pkgbase='python-gql'
pkgname='python-gql'
pkgver=0.2.0
pkgrel=1
pkgdesc="Python GraphQL client"
arch=('any')
url="https://github.com/graphql-python/gql"
license=('MIT')
depends=('python-six' 'python-graphql-core' 'python-promise' 'python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/c4/6f/cf9a3056045518f06184e804bae89390eb706168349daa9dff8ac609962a/gql-0.2.0.tar.gz")
sha256sums=('ad0f0b8226428d727c8e1d1cac4e521d83ed024d814921bd55b8adb997dadf4b')

build() {
  cd "$srcdir"/gql-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/gql-$pkgver
  python setup.py install --skip-build -O1 --root="$pkgdir"
}

