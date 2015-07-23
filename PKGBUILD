# Maintainer: Nikola Milinković <nikmil@gmail.com>

pkgname=python2-guessit-git
pkgver=0.10.3.r29.gad6be75
pkgrel=1
_gitname="guessit"
_gitroot="git+https://github.com/wackou/guessit"
pkgdesc="A library for guessing information from video files."
arch=(any)
url="https://github.com/wackou/guessit"
license=(LGPL)
depends=('python2' 'python2-babelfish' 'python2-stevedore')
makedepends=('python2-distribute')
conflicts=('python2-guessit')
provides=('python2-guessit=${pkgver}')
source=("${_gitname}::${_gitroot}")
md5sums=('SKIP')

pkgver () {
  cd ${_gitname}
  git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_gitname}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
