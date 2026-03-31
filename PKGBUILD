# Maintainer: Yair Reshef <yair99@gmail.com>
# Contributor: Sergio Correia <sergio@correia.cc>
# Contributor: bl4ckb1t <bl4ckb1t@gmail.com>

pkgname=ezstream
pkgver=1.0.2
pkgrel=1
pkgdesc="A command line source client for Icecast media streaming servers."
arch=('i686' 'x86_64')
url="http://www.icecast.org/ezstream"
license=('GPL')
depends=('libogg' 'libvorbis' 'libxml2' 'libshout' 'taglib' 'check')
install=ezstream.install



source=(http://downloads.xiph.org/releases/ezstream/"${pkgname}"-"${pkgver}".tar.gz)
sha256sums=('11de897f455a95ba58546bdcd40a95d3bda69866ec5f7879a83b024126c54c2a')


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
