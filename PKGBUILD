# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libcxml
pkgver=0.17.17
pkgrel=1
pkgdesc="A small C++ library which makes it marginally neater to parse XML using libxml++"
arch=('i686' 'x86_64')
url="https://carlh.net/libcxml"
license=('GPL')
depends=('libxml++2.6' 'boost-libs>=1.91.0' )
makedepends=('git' 'python' 'pkg-config' 'boost')
source=("$pkgname-$pkgver::git+https://git.carlh.net/git/libcxml.git#tag=v$pkgver")
<<<<<<< HEAD
sha256sums=('99cde935cc5822dac785dbc8539973ca6e786456b2c2421e564bffeb7dfb334a')
=======
sha256sums=('e0d158b72f4003e0f1ec62b3e6bf1c8196b1a62dc361b208aa7cebb6f9f425be')
>>>>>>> 123a4c6baa2b93f2bb22e11bdc52cbbaf10a1c70

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python waf configure --prefix=/usr
    python waf build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python waf install --destdir="$pkgdir"
  cd "${pkgdir}"
  if [ -d usr/lib64   ]
    then
       mv usr/lib64 usr/lib
    fi
}
