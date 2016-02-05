# Maintainer: Fabien JUIF <fabien.juif@gmail.com>
application=himawaripy
pkgname=${application}-git
pkgrel=1
pkgver=r31.c302881
pkgdesc="Put near-realtime picture of Earth as your desktop background."
url="https://github.com/boramalper/${application}"
arch=('x86_64' 'i686')
depends=('python' 'python-pillow')
makedepends=('git')
source=(
  "git+https://github.com/sutat/${application}"
)
sha256sums=(
  'SKIP'
)

package() {
  cd ${srcdir}/${application}
  python setup.py install --root="$pkgdir/" --optimize=1

  cd ${pkgdir}/usr/bin
  mv start ${application}
}

pkgver() {
  cd ${application}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
