# Maintainer: buzz <buzz@users.noreply.github.com>
# Contributor: Yair Reshef <yair99@gmail.com>
pkgname=ices
pkgver=2.0.3
pkgrel=1
pkgdesc="IceS is a source client for the Icecast streaming server."
arch=('i686' 'x86_64')
url="https://icecast.org/ices/"
license=('GPL-2.0-or-later')
depends=('libogg' 'libvorbis' 'libxml2' 'libshout' 'taglib')

source=(https://downloads.xiph.org/releases/"${pkgname}"/"${pkgname}"-"${pkgver}".tar.bz2)
sha256sums=('e620c67c8b311520b1d6a8a89d7fd1d1d08f299534d274b8a1a36ed33a7ee4a8')

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
