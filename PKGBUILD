# Contributor: vsilv <vsilv@posteo.eu>
# Maintainer : vsilv <vsilv@posteo.eu>
pkgname=python-krakenex
pkgver=v3.1.0.r0.g1d06fe5
pkgrel=1
pkgdesc="Wrapper for krakenex"
arch=('x86_64')
url="https://github.com/veox/python3-krakenex"
license=('LGPLv3')
depends=('python>=3.6')
makedepends=('git')
provides=('python-krakenex')
source=('python-krakenex::git+https://github.com/veox/python3-krakenex.git')

md5sums=('SKIP')
_gitname='python-krakenex'

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

