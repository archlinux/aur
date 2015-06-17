#Maintainer: Quan Guo <guotsuan@gmail.com>

pkgname=python2-cosmolopy
pkgver=0.1.103.r20.gf23ea37
pkgrel=1
pkgdesc="a cosmology package for Python"
url="http://roban.github.com/CosmoloPy/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python2-scipy' 'python2-numpy')
makedepends=('cython2' 'git')
source=(cosmolopy::git+https://github.com/roban/CosmoloPy.git)
md5sums=('SKIP')
provides=('python2-cosmolopy')

_gitname="cosmolopy"

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}


package() {
  cd "$srcdir"/${_gitname}
  python2 setup.py install --prefix=/usr --root="$pkgdir"/ --optimize=1
}

