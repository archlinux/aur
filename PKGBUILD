# Maintainer: Nicholas Yim <nickyim05@gmail.com>

pkgname=python-opencc
pkgver=0.2
pkgrel=1
pkgdesc="An OpenCC converter for Python."
arch=('x86_64')
depends=('opencc')
makedepends=('python-setuptools')
url="https://github.com/lepture/opencc-python"
license=('Apache')
options=(!emptydirs)
source=(https://github.com/lepture/opencc-python/archive/v$pkgver.tar.gz)
sha256sums=('6c581666853f8267a7d9f97ecf6ccc80d05e47c8a9f5ea8428c675166f3d76c1')

build() {
  cd "$srcdir/opencc-python-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/opencc-python-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
