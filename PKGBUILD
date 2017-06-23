# Maintainer: vsilv vsilv@posteo.eu

pkgname=python-cexio-client
pkgver=r2.7a3f1e0
pkgrel=1
pkgdesc="Codebase for WebSocket & REST client software for CEX.IO"
arch=('x86_64')
license=('MIT')
depends=('python>=3.5')
makedepends=('git')
provides=('python-cexio-client')
_gitname='cex.io-client'
source=(${_gitname}'::git+https://github.com/cexioltd/CEX.IO-Client-Python3.5.git')
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

