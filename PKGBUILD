# Maintainer: Yair Reshef <yair99@gmail.com>
# Contributor: Sergio Correia <sergio@correia.cc>
# Contributor: bl4ckb1t <bl4ckb1t@gmail.com>

pkgname=ezstream
pkgver=1.0.1
pkgrel=1
pkgdesc="A command line source client for Icecast media streaming servers."
arch=('i686' 'x86_64')
url="http://www.icecast.org/ezstream.php"
license=('GPL')
depends=('libogg' 'libvorbis' 'libxml2' 'libshout' 'taglib')



source=(http://downloads.xiph.org/releases/ezstream/"${pkgname}"-"${pkgver}".tar.gz)
sha256sums=('fc4bf494897a8b1cf75dceefb1eb22ebd36967e5c3b5ce2af9858dbb94cf1157')


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
