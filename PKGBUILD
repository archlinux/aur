# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=zita-jacktools
pkgname="python-${_pkgname}"
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python library for audio tools running as a JACK client"
arch=(i686 x86_64)
url="http://kokkinizita.linuxaudio.org/linuxaudio/downloads/"
license=('LGPL')
depends=('python-zita-audiotools' 'zita-convolver>=4.0.0' 'zita-jclient')
source=("${url}${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('e7dfd0f2a214dc9f8db8d64638447db564faf35f9962e27df025cae153159926')


build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
