# Maintainer: Nick Burrett <nick@sqrt.co.uk>
pkgname=comskip
pkgver=0.93
pkgrel=3
pkgdesc='Comskip is a free MPEG commercial break detector'.
_gitname='comskip'
url='http://github.com/erikkaashoek/Comskip'
arch=('x86_64' 'i686')
license=('GPL3')
depends=('ffmpeg2.8' 'argtable')
source=("${_gitname}::git+https://github.com/erikkaashoek/Comskip.git#branch=master")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_gitname}"
  ./autogen.sh
  PKG_CONFIG_PATH=/usr/lib/ffmpeg2.8/pkgconfig ./configure --prefix=/usr
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m755 "${srcdir}/${_gitname}/comskip" "$pkgdir/usr/bin/comskip"
}

# vim:set ts=2 sw=2 et:
