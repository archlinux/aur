# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-pysigset
pkgver=0.3.2
pkgrel=1
pkgdesc="Python blocking/suspending signals under Linux/OSX using ctypes sigprocmask access"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/ossobv/pysigset"
license=('GPL3')
options=(!emptydirs)
source=(https://pypi.python.org/packages/9f/ce/789466fea28561b0a38f233b74f84701407872a8c636c40f9f3a8bb4debe/pysigset-0.3.2.tar.gz)
md5sums=('80ce0376998bb36b0868d0c2921f6829')
sha256sums=('a877bf6189881c8ef210e9a6fde15b090b6af1b4b35a7da2830c5d6ec727a47a')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
