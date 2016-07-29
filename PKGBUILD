# Maintainer: yubimusubi

_pkgbase=vndc
pkgname=${_pkgbase}-git
pkgver=2
pkgrel=1
pkgdesc="vndc - VNDC is Not a Direct Clone (of VNDS ;P)"
arch=('i686' 'x86_64')
url='https://github.com/chaoskagami/vndc'
license=('GPL')
depends=('sdl2_mixer' 'sdl2_image' 'sdl2_ttf')
provides=('vndc')
conflicts=('vndc')
# Dependency 'smpeg' 'bzip2' already satisfied
source=(git+https://github.com/chaoskagami/vndc.git)
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgbase}"
  ./autogen.sh
  ./configure --prefix=${pkgdir}/usr

  make
}

package() {
  cd "${srcdir}/${_pkgbase}"
  make install

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgbase}"
  install -m644 README.md LICENSE SCRIPTINGDOC.md "${pkgdir}/usr/share/doc/${_pkgbase}"
}

# vim:set ts=2 sw=2 et:
