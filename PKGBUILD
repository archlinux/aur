# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-kmeans
pkgver=1.0.2
pkgrel=1
pkgdesc="Python wrapper for basic C implementation of kmeans"
arch=('i686' 'x86_64')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/numberoverzero/kmeans"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/k/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('7b042b9ea3fbe111afe920b70ee15b36')
sha256sums=('96c4d7410bcd251e583eb2b817d133e678453d6ef7c5773f1263345eb47c24e2')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
