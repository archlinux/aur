# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=zita-audiotools
pkgname="python-${_pkgname}"
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python library with tools for audio processing"
arch=(i686 x86_64)
url="http://kokkinizita.linuxaudio.org/linuxaudio/downloads/"
license=('LGPL')
depends=('python-numpy' 'zita-resampler')
source=("${url}${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('f81fd466def0bbe1385973d38d7c51b6a9b7f7a8a37faf126feb9a14f2c14b2f')


build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
