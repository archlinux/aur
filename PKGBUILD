#Maintainer: jnanar <info@agayon.be>

pkgname=python-shortuuid-git
pkgver=v1.0.1.r1.g664367f
pkgrel=1
pkgdesc="shortuuid is a simple python library that generates concise, unambiguous, URL-safe UUIDs."
arch=(any)
url="https://github.com/skorokithakis/shortuuid"
license=('BSD')
depends=('python')
makedepends=('git')
options=(!emptydirs)
provides=('python-shortuuid')
replaces=('python-shortuuid')
conflicts=('python-shortuuid')
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
  python setup.py install --root="$pkgdir/" --optimize=1
}
