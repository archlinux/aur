#Maintainer: jnanar <info@agayon.be>

pkgname=python2-shortuuid-git
pkgver=v0.5.0.r6.ge6ed792
pkgrel=1
pkgdesc="shortuuid is a simple python library that generates concise, unambiguous, URL-safe UUIDs."
arch=(any)
url="https://github.com/skorokithakis/shortuuid"
license=('BSD')
depends=('python2')
makedepends=('git')
options=(!emptydirs)
provides=('python2-shortuuid')
replaces=('python2-shortuuid')
#optdepends=('')

source=('git+https://github.com/skorokithakis/shortuuid.git')
_gitname="shortuuid"
md5sums=('SKIP')


pkgver() {
  cd $_gitname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}