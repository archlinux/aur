# Maintainer: Leonid Selivanov <bravebug at gmail dot com>
#
pkgname=python-sqlite-icu-git
pkgver=r8.79bc98f
pkgrel=1
pkgdesc="python module with loadable ICU extension for sqlite"
arch=('any')
url="http://github.com/karlb/sqlite-icu"
license=(MIT)
depends=(python)
options=(!emptydirs)
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver () {
   	cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
