# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=python-pulsectl
_gitname=python-pulse-control
pkgver=20.6.0
pkgrel=1
pkgdesc="high-level interface and ctypes-based bindings for PulseAudio (libpulse)"
arch=('any')
url="https://github.com/mk-fg/python-pulse-control"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
# Upstream does not tag releases, check https://github.com/mk-fg/python-pulse-control/commits/master/setup.py
# and find the latest commit that updates version in setup()
source=(git+"https://github.com/mk-fg/python-pulse-control.git?commit=471428cd7d03356f0641fe93a8156b799d57ce02")
md5sums=('SKIP')

build() {
  cd ${_gitname}
  python setup.py build
}

package() {
  cd ${_gitname}
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
