# Contributor: Trevor <assviolat0r at live dot com>

pkgname=python-rivescript-git
pkgver=220.a28deb3
pkgrel=1
pkgdesc="Rendering Intelligence Very Easily"
arch=('any')
license=('MIT')
depends=('python-six' 'python')
conflicts=('python-rivescript')
makedepends=('git' 'python-setuptools')
url='https://github.com/aichaos/rivescript-python'
source=('git+https://github.com/aichaos/rivescript-python.git')
md5sums=('SKIP')
_gitname=rivescript-python

pkgver () {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git describe --always | sed 's/-/./g')
}

package() {
   cd "$srcdir/$_gitname"
   python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 || return 1
}
