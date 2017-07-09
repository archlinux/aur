# Maintainer: vsilv vsilv@posteo.eu

pkgname=python-gdax
pkgver=r2.7a3f1e0
pkgrel=1
pkgdesc="The unofficial Python client for the GDAX API "
arch=('x86_64')
license=('MIT')
depends=('python>=3.5' 'python-bintrees>=2.0' 'python-requests>=2.13' 'python-six>=1.10' 'python-websocket-client>0.40')
makedepends=('git')
provides=('python-gdax')
_gitname='python-gdax'
source=(${_gitname}'::git+https://github.com/acontry/GDAX-Python.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "${srcdir}/${_gitname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --prefix=/usr --root=${pkgdir} -O1 --skip-build
}

