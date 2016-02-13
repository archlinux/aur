# Maintainer: Fabien JUIF <fabien.juif@gmail.com>
application=himawaripy
pkgname=${application}-git
pkgrel=1
pkgver=r87.f18836f
license=('MIT')
pkgdesc="Put near-realtime picture of Earth as your desktop background."
url="https://github.com/boramalper/${application}"
arch=('x86_64' 'i686')
depends=('python' 'python-pillow' 'python-tzlocal' 'python-dateutil')
makedepends=('git' 'python-setuptools')
source=(
  "git+https://github.com/boramalper/${application}"
)
sha256sums=(
  'SKIP'
)

package() {
  cd ${srcdir}/${application}
  python setup.py install --root="$pkgdir/" --optimize=1
}

pkgver() {
  cd ${application}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
