# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot com>

pkgname=norminette-git
_pkgname=norminette
pkgver=r546.d443df7
pkgrel=1
pkgdesc="Open source norminette"
arch=('any')
url='https://github.com/42School/norminette'
license=('MIT')
conflicts=('norminette')
makedepends=('git' 'python-setuptools')
source=("${_pkgname}"::'git+https://github.com/42School/norminette.git')
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
