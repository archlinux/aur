#Maintainer: ewhal4 <ewhal4 at live dot com>
#Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>
pkgname=ladspa-bs2b
pkgver=0.9.1
pkgrel=3
pkgdesc="Bauer stereophonic-to-binaural DSP effect library - LADSPA plugin"
arch=('i686' 'x86_64')
url=http://bs2b.sourceforge.net
license=('GPL')
depends=('libbs2b' 'ladspa')
makedepends=()
source=("http://downloads.sourceforge.net/project/bs2b/plugins/LADSPA%20plugin/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('f3926a6d5effb7c70a4b69db30c186d5')

build() {
  cd ${srcdir}/$pkgname-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$pkgname-${pkgver}
  make DESTDIR=${pkgdir} install
}

