# Maintainer: Fabien JUIF <fabien.juif@gmail.com>
_application=himawaripy
pkgname=${_application}-git
pkgrel=2
pkgver=r87.f18836f
license=('MIT')
pkgdesc="Put near-realtime picture of Earth as your desktop background."
url="https://github.com/boramalper/${_application}"
arch=('x86_64' 'i686')
depends=('python' 'python-pillow' 'python-tzlocal' 'python-dateutil')
makedepends=('git' 'python-setuptools')
source=(
  "git+https://github.com/boramalper/${_application}"
)
sha256sums=(
  'SKIP'
)

package() {
  cd ${srcdir}/${_application}
  python setup.py install --root="${pkgdir}/" --optimize=1
}

pkgver() {
  cd ${_application}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
