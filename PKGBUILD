# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=legit-git
pkgver=0.r228.473d87d
pkgrel=1
pkgdesc="Sexy Git CLI, Inspired by GitHub for Mac™."
arch=('any')
url="https://github.com/kennethreitz/legit"
license=('BSD')
depends=('python2' 'python2-gitpython' 'python2-clint' 'python2-gitdb' 'python2-args')
makedepends=('git')
source=("$pkgname::git+https://github.com/kennethreitz/legit.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  python2 setup.py install --root=$pkgdir
  install -Dm644 LICENSE \
        ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 sts=2 et:
