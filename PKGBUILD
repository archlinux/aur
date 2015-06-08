# Maintainer: Jon Gjengset <jon@tsp.io>
# Contributor: Wai Hon Law <whhone@gmail.com>

pkgname=codemod-git
pkgver=r5.298d47a
pkgrel=1
epoch=2
pkgdesc="codemod is a tool that assists you with large-scale codebase refactors that can be partially automated but still require human oversight and occassional intervention."
arch=('any')
url="https://github.com/facebook/codemod"
license=('Apache')
depends=('python2')
makedepends=('git')
source=("$pkgname::git+https://github.com/whhone/codemod.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 755 src/codemod.py "$pkgdir/usr/bin/codemod"
}
