# Maintainer: robertfoster

pkgname=python-pysha3
pkgver=1.0.2 # renovate: datasource=github-tags depName=tiran/pysha3
pkgrel=1
pkgdesc="SHA-3 wrapper (keccak) for Python"
arch=('i686' 'x86_64' 'armv6')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/tiran/pysha3"
license=('PSFL')
options=(!emptydirs)
source=("https://github.com/tiran/pysha3/archive/${pkgver}.tar.gz")

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
sha256sums=('b7691514fdb389037d3428bc4e7764715805ff829419aaa7f8bd09215e22e5d5')
