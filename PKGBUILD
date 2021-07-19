# Maintainer:  Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>

pkgname=python-pulsectl-git
_gitname=python-pulse-control
pkgver=20210522
pkgrel=1
pkgdesc="Python high-level interface and ctypes-based bindings for PulseAudio (libpulse) -- git version"
arch=('x86_64')
url="https://github.com/mk-fg/python-pulse-control"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=('python-pulsectl')
conflicts=('python-pulsectl')
source=('git+https://github.com/mk-fg/python-pulse-control.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 ft=sh et:
