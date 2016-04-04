# Maintainer: sudokode <sudokode@gmail.com>

pkgname=jshlint
pkgver=r7.d6f914c
pkgrel=1
pkgdesc="Use Douglas Crockford's jslint in a console"
arch=('any')
url="https://github.com/sudokode/jshlint.git"
license=('custom:JSON')
makedepends=('git')
depends=('js')
source=("$pkgname::git+https://github.com/sudokode/jshlint.git"
        'jslint::git+https://github.com/douglascrockford/JSLint.git')
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd $pkgname

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname

  install -Dm755 jshlint "$pkgdir/usr/bin/jshlint"

  install -Dm644 lint.js "$pkgdir/usr/lib/jshlint/lint.js"
  install -Dm644 ../jslint/jslint.js "$pkgdir/usr/lib/jshlint/jslint.js"

  install -Dm644 LICENSE "$pkgdir/usr/share/jshlint/LICENSE"
}

# vim:set ts=2 sw=2 et:
