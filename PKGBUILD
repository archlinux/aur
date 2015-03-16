# Maintainer: André <andre-arch@delorus.de>
pkgname=python2-fitparse-git
_gitname=python-fitparse
pkgver=r43.462598c
pkgrel=1
pkgdesc="Garmin FIT file parser implementation"
arch=('i686' 'x86_64')
source=(git+https://github.com/dtcooper/python-fitparse.git)
url="https://github.com/dtcooper/python-fitparse"
license=('Python' "custom:python2-fitparse")
depends=('python2')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"

  install -dm755 ${pkgdir}/usr/lib/python2.7/site-packages/fitparse
  cp fitparse/* ${pkgdir}/usr/lib/python2.7/site-packages/fitparse

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/python2-fitparse/LICENSE
}
