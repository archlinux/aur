# Contributor: vsilv <vsilv@posteo.eu>
# Maintainer : vsilv <vsilv@posteo.eu>
pkgname=python-quandl
pkgver=v3.1.0.r0.g1d06fe5
pkgrel=1
pkgdesc="Wrapper for quandl-python"
arch=('x86_64')
url="https://github.com/quandl/quandl-python"
license=('MIT')
depends=('python-numpy' 'python-more-itertools')
makedepends=('python>=3.6' 'git')
provides=('python-quandl')
source=('python-quandl::git+https://github.com/quandl/quandl-python.git')

md5sums=('SKIP')
_gitname='python-quandl'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
build() {
  cd "${srcdir}/${_gitname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --prefix=/usr --root=${pkgdir} -O1 --skip-build
}

