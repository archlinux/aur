# Maintainer: robertfoster

_name=timeout-decorator
pkgname=python-${_name}
pkgver=0.4.1
pkgrel=1
pkgdesc="Timeout decorator for Python"
arch=('i686' 'x86_64' 'armv6')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/pnpnpn/timeout-decorator"
license=('MIT')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/t/${_name}/${_name}-$pkgver.tar.gz")

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

md5sums=('04cf660cf86815dd6f564b68aea6630d')
