# Maintainer: Trougnouf (Benoit Brummer) <trougnouf@gmail.com>

_name=pysuntimes
pkgname=("${_name}-git")
pkgver=r3.16c6fdf
pkgrel=1
pkgdesc="Print suntimes given a date and a set of coordinates. (civil/nautical/astronomical twilights, sunset/sunrise, and golden hours)"
arch=('any')
url="https://github.com/trougnouf/${_name}"
license=('GPL')
depends=('python-pyephem' 'python-timezonefinder' 'python-pytz')
provides=("python-${_name}")
conflicts=("python-${_name}")
source=("git+${url}.git")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_name}"
  mkdir -p "${pkgdir}/usr/bin/"
  cp suntimes.py "${pkgdir}/usr/bin/"
  chmod +x "${pkgdir}/usr/bin/suntimes.py"
}

