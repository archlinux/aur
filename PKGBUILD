# Maintainer: Yair Reshef <yair99@gmail.com>
# Contributor: Sergio Correia <sergio@correia.cc>
# Contributor: bl4ckb1t <bl4ckb1t@gmail.com>

pkgname=ezstream
pkgver=0.6.0
pkgrel=3
pkgdesc="A command line source client for Icecast media streaming servers."
arch=('i686' 'x86_64')
url="http://www.icecast.org/ezstream.php"
license=('GPL')
depends=('libogg' 'libvorbis' 'libxml2' 'libshout' 'taglib')



source=(http://downloads.xiph.org/releases/ezstream/"${pkgname}"-"${pkgver}".tar.gz)
sha256sums=('f86eb8163b470c3acbc182b42406f08313f85187bd9017afb8b79b02f03635c9')


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
