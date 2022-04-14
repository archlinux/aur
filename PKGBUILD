# Contributor: damir <damir@archlinux.org>
#Maintainer: Nathan Owe <ndowens.aur at gmail.com>
pkgname=clusterit
pkgver=2.5
pkgrel=3
pkgdesc="Tools to make a cluster of computers"
arch=('i686' 'x86_64')
license=('BSD')
url="http://www.sourceforge.net/projects/clusterit"
depends=('libx11' 'sh')
conflicts=('synce-librapi')
source=(http://downloads.sourceforge.net/clusterit/${pkgname}-${pkgver}.tar.gz 'LICENSE')
sha256sums=('e50597fb361d9aefff0250108900a3837a4a14c46083d6eb5ed5d7fc42ce9f35'
            '07bc5270e9bb7977358f934699eee397be9422a523af0a3fdd75732f3a8202a5')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir}/ INSTALL=/bin/install install
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}

