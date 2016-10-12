# Maintainer: Luca Weiss <WEI16416 (at) spengergasse (dot) at>

pkgname=python-libdesktop-git
_pkgname=libdesktop
pkgver=r29.1193c2f
pkgrel=1
pkgdesc="OS and desktop integration made easy."
arch=('any')
url="https://github.com/bharadwaj-raju/libdesktop"
license=('MIT')
depends=('python')
makedepends=('git')
options=(!emptydirs)
source=("git+https://github.com/bharadwaj-raju/libdesktop")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
