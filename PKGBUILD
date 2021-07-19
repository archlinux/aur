# Maintainer:  Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>

pkgname=python-pulsectl-asyncio-git
_gitname=pulsectl-asyncio
pkgver=20210613
pkgrel=1
pkgdesc="Asyncio frontend for pulsectl, a Python bindings library for PulseAudio (libpulse) -- git version"
arch=('x86_64')
url="https://github.com/mhthies/pulsectl-asyncio"
license=('MIT')
depends=('python>=3.6' 'python-pulsectl>=1:21.5.18')
makedepends=('git' 'python-setuptools')
provides=('python-pulsectl-asyncio')
conflicts=('python-pulsectl-asyncio')
source=('git+https://github.com/mhthies/pulsectl-asyncio.git')
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
